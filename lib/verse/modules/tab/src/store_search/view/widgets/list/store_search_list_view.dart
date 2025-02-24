import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store_search/src/store_search_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/manager/store_search_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/state/bloc/banana_store_search/banana_store_search_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_default.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/store/bd_ui_store_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreSearchListView extends StatefulWidget {
  final bool isUpdate;
  final int start;
  final String keyword;
  const StoreSearchListView({super.key,
    required this.isUpdate,
    required this.start,
    required this.keyword
  });

  @override
  State<StoreSearchListView> createState() => _StoreSearchListViewState();
}

class _StoreSearchListViewState extends State<StoreSearchListView> {
  late ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _controller.addListener(() async {
      if (_controller
          .position
          .maxScrollExtent == _controller
          .position
          .pixels) {
        if (widget.isUpdate == false) {
          context.read<StoreSearchRepositoryImpl>().originData(
            keyword: widget.keyword, start: widget.start,
          ).then((value) {
            value.statusEnum == StatusEnum.success
                ? context.read<StoreSearchManager>().changePage(
                context: context,
                page: widget.start + 1,
                keyword: widget.keyword)
                : context.read<StoreSearchManager>().changeUpdate(
                context: context, value: true);
          });
        }
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocSelector<BananaStoreSearchBloc, BananaStoreSearchState, List<StoreVO>>(
      selector: (state) => state.storeShow,
      builder: (context, storeList) =>
          storeList.isNotEmpty
          ? Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              interactive: false,
              thickness: size.sizedBox2,
              controller: _controller,
              child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  controller: _controller,
                  itemCount: storeList.length,
                  padding: EdgeInsets.only(
                      right: size.sized8grid
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      BdUiStoreListTile(
                        key: ValueKey('${storeList[index].smMId}_$index'),
                        storeVO: storeList[index],
                        size: size,
                        onTapF: context.read<VerseConfig>().function.debounce(
                            callback: (){
                              context.read<StoreSearchManager>().updateFavorite(
                                context: context,
                                smId: storeList[index].smMId,
                                mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,
                                isFavorite: storeList[index].favoriteStore == 0,
                              );
                            }
                        ),
                        onTap: (){
                          context.read<StoreSearchManager>().storeTileClick(context: context, storeVO: storeList[index]);
                        },
                      )
              )
          )
              : const BdUiDefault(text: '검색된 매장이 없습니다.')

      ,
    );
  }
}
