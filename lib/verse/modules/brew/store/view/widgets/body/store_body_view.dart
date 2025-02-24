import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store/src/store_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/manager/store_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/state/bloc/banana_store/banana_store_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/state/bloc/banana_store_option/banana_store_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/bd_refresh_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/indicator/bd_refresh_indicator.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_default.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/store/bd_ui_store_list_tile.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/store/bd_ui_store_sort_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreBodyView extends StatelessWidget {
  const StoreBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaStoreBloc, BananaStoreState, StatusEnum>(
      selector: (state) => state.statusEnum,
      builder: (context, statusEnum) => switch(statusEnum){
        StatusEnum.initial => const BdLoadingSpin(),
        StatusEnum.loading => const BdLoadingSpin(),
        StatusEnum.success => const _Success(),

        StatusEnum.failure => const _Success(),
        _ => BdRefreshButton(
          onTap: (){
            context.read<StoreManager>().refreshButton(context: context);
          },
        )
      },
    );

  }
}


class _Success extends StatelessWidget {
  const _Success();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BdCustomPad(padEnum: PadEnum.height8),
        _SortBarBuilder(),
        BdCustomPad(padEnum: PadEnum.height12),
        Expanded(child: _Content())
        // _AdBox(),
      ],
    );
  }
}


class _SortBarBuilder extends StatelessWidget {
  const _SortBarBuilder();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context){
        final option = context.watch<BananaStoreOptionBloc>().state;
        return _SortBar(
          currentSort: option.currentSort,
          page: option.page,
          order: option.order,
          orderBy: option.orderBy,
          isUpdate: option.isUpdate,
        );
      },
    );
  }
}


class _SortBar extends StatefulWidget {
  final int currentSort;
  final int page;
  final String order;
  final String orderBy;
  final bool isUpdate;
  const _SortBar({
    required this.currentSort,
    required this.page,
    required this.order,
    required this.orderBy,
    required this.isUpdate,
  });

  @override
  State<_SortBar> createState() => _SortBarState();
}

class _SortBarState extends State<_SortBar> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<StoreManager>().storeController(context).addListener(() async {
      if (context
          .read<StoreManager>()
          .storeController(context)
          .position
          .maxScrollExtent == context
          .read<StoreManager>()
          .storeController(context)
          .position
          .pixels) {
        if (widget.isUpdate == false) {
          context.read<StoreRepositoryImpl>().fetchData(
              page: (widget.page + 1) * 20,
              order: widget.order,
              orderBy: widget.orderBy
          ).then((value) {
            if (context.mounted) {
              value.statusEnum == StatusEnum.success
                  ? context.read<StoreManager>().changePage(
                  context: context,
                  page: widget.page + 1,
                  store: convertStoreVO(value.data))
                  : context.read<StoreManager>().changeUpdate(
                  context: context, value: true);
            }
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BdUiStoreSortBar(
      onTap: () {
        context.read<StoreManager>().changeUpdate(
            context: context, value: false);
        context.read<StoreManager>().selectSort(context: context);
      },
      index: widget.currentSort,
      sortEnum: StoreSortEnum.store,
    );
  }
}


class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return  BlocSelector<BananaStoreBloc, BananaStoreState, List<StoreVO>>(
      selector: (state) => state.storeShow,
      builder: (context, show) =>
          show.isNotEmpty
          ?
          BdRefreshIndicator(
            onRefresh: () async{
              context.read<StoreManager>().refreshButton(context: context);
            },
            child: Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              interactive: false,
              thickness: size.sizedBox2,
              controller: context.read<StoreManager>().storeController(context),
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics().applyTo(const ClampingScrollPhysics()),
                  controller: context.read<StoreManager>().storeController(context),
                  itemCount: show.length,
                  padding: EdgeInsets.only(
                      right: size.sized8grid
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                    BdUiStoreListTile(
                      key: ValueKey('${show[index].smMId}_$index'),
                      size: size,
                      storeVO: show[index],
                      onTapF: context.read<VerseConfig>().function.debounce(
                          callback: (){
                            context.read<StoreManager>().updateFavorite(
                              context: context,
                              smId: show[index].smMId,
                              mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,
                              isFavorite: show[index].favoriteStore == 0,
                            );
                          }
                      ),
                      onTap: (){
                        context.read<StoreManager>().storeTileClick(context: context, storeVO: show[index]);
                      },
                    )
                      // StoreBodyListTile(
                      //   key: ValueKey(index),
                      //   storeVO: show[index],
                      //   widgetSize: widgetSize,
                      // )
              ),
            ),
          )
          : BdUiDefault(
              text: '설정 지역 주변에 등록된 매장이 없어요')
          ,
    );
  }
}