import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/bloc/banana_broad_deal/banana_broad_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/deal/edit/deal_edit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/deal/manager/deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/deal/view/widgets/deal_body_list_tile_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/floating/bd_floating_action_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_icons_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/bd_refresh_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/indicator/bd_refresh_indicator.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_default.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealView extends StatelessWidget {
  const DealView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<DealManager>(
      create: (BuildContext context) => const DealManager(
        edit: DealEdit()
      ),
      child: const _Canvas(),
    );
  }
}


class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
        isPage: true,
        canvasEnum: CanvasEnum.homeCom,
        appbar: ('My 딜', null, null, _Action()),
        // listener:  StoreListener(),
        navNullAble: true,
        body: _Body(),
        floatingActionButton: _Floating(),
    );
  }
}


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaBroadDealBloc, BananaBroadDealState, StatusEnum>(
      selector: (state) => state.receiveDealList.$1,
      builder: (state, status) {
        if (kDebugMode) {
          print(status);
        }
        return switch(status){
        StatusEnum.initial || StatusEnum.loading => const BdLoadingSpin(),
        StatusEnum.success => const _List(),
        StatusEnum.later  => const BdUiDefault(
          text: '등록된 딜이 없어요.',
          text2: '+ 버튼을 눌러 새로운 딜을 시작해보세요!',
        ),
          StatusEnum.failure => BdUiDefault(
            text: '등록된 딜이 없어요.',
            text2: '+ 버튼을 눌러 새로운 딜을 시작해보세요!',
            onTap: (){ context.read<DealManager>().refreshDealData(context);},
          ),
        _ => BdRefreshButton(
          onTap: () {
            context.read<DealManager>().refreshDealData(context);
          },
        )

      };
      },
    );
  }
}

class _List extends StatefulWidget {
  const _List();

  @override
  State<_List> createState() => _ListState();
}

class _ListState extends State<_List> {
  late ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaBroadDealBloc, BananaBroadDealState, List<MyDealListVO>>(
      selector: (state) => state.receiveDealList.$2,
      builder: (context, dealList) =>
          Scrollbar(
            controller: _controller,
            child: BdRefreshIndicator(
              onRefresh: () async{
                context.read<DealManager>().refreshDealData(context);
              },
              child: ListView.builder(
                  controller: _controller,
                  physics: const AlwaysScrollableScrollPhysics().applyTo(const ClampingScrollPhysics()),
                  itemCount: dealList.length,
                  itemBuilder: (BuildContext context, int index){
                    return DealBodyListTileView(
                      key: ValueKey('${dealList[index].diIdx}_$index'),
                      dealVO: dealList[index],
                      color: dealList[index].diStatus == '진행중'
                          ? white
                          : greyF4F4F4,
                    );
                  }
              ),
            ),
          ),
    );
  }
}




class _Action extends StatelessWidget {
  const _Action();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaBroadDealBloc, BananaBroadDealState, List<MyDealListVO>>(
      selector: (state) => state.receiveDealList.$2,
      builder: (context, dealList) =>
      dealList.isNotEmpty
        ?
          Row(
            children: [
              BdRippleIconsButton(
                padding: EdgeInsets.all(context.read<VerseConfig>().size.sizedBox7_5),
                size: context.read<VerseConfig>().size,
                onTap: (){
                  final List<MyDealListVO> list = dealList;
                  list.removeWhere((e) => e.diStatus == '진행중');
                  if (kDebugMode) {
                    print(list.length);

                  }context.read<DealManager>().edit.gotoDealManagement(routerContext: context, dealList: list);
                },
                icon: Icons.manage_history,
              ),
              const BdCustomPad(padEnum: PadEnum.width12),
            ],
          ) : const SizedBox()
    );
  }
}

class _Floating extends StatelessWidget {
  const _Floating();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocSelector<BananaBroadDealBloc, BananaBroadDealState, List<MyDealDetailVO>>(
      selector: (state) => state.myDealInfo.$2,
      builder: (state, myDeal) {
        (GestureTapCallback ,IconData) result =
        myDeal.isEmpty
            ? ((){
              context.read<DealManager>().gotoCreateDealView(context);
        }, Icons.add)
            : ((){
          context.read<VerseConfig>().browser.sheet.option.showSheet(
              routerContext: context, myDealDetail: myDeal.first);
        }, Icons.phone_android);
        return SizedBox(
        width: size.srcFloatingActionBarSize,
        height: size.srcFloatingActionBarSize,
        child: BdFloatingActionButton(
          onPressed: result.$1,
          iconData: result.$2,
        ),
      );
      },
    );
  }
}
