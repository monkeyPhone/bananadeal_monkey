import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_deal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../css/size.dart';
import '../../../../css/style.dart';
import '../bottom_nav_bar/controllers/bd_bot_nav_controller.dart';
import '../controllers/src_info_controller.dart';
import '../controllers/src_route_controller.dart';

class SrcFloatingRoute extends GetView<SrcInfoController> {
  const SrcFloatingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (isUse) => isUse.value == '이용중'
            ?  _SrcFloatingAction()
            :  const SizedBox()
        , controller.mIsUsed );
  }
}


class _SrcFloatingAction extends GetView<BdBotNavController> {
  const _SrcFloatingAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return ObxValue(
                (page) => page.value == 2
                    ?   SizedBox(
                          width: WidgetSize(context).srcFloatingActionBarSize,
                          height: WidgetSize(context).srcFloatingActionBarSize,
                          child: _SrcFloatingActionDeal(),
                        )
                    :   const SizedBox()
            , controller.pageFloatingChangeIndex );
  }
}

class _SrcFloatingActionDeal extends GetView<SrcDealController> {
  const _SrcFloatingActionDeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (currentDealList) => currentDealList.isEmpty
            ?   SizedBox(
          width: WidgetSize(context).srcFloatingActionBarSize,
          height: WidgetSize(context).srcFloatingActionBarSize,
          child: FloatingActionButton(
            backgroundColor: Style.yellow,
            onPressed: () async{
              await SrcRouteController.to.makeDeal(context: context, invite: '');
            },
            elevation: 1,
            child: Center(
                child: Icon(
                  Icons.add ,
                  size: WidgetSize(context).width007,
                )
            ),
          ),
        )
            :   const SizedBox()
        , controller.currentDealList );
  }
}
