import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../src_components/controllers/src_deal_controller.dart';
import '../../../controllers/deal_controller.dart';
import 'end_deal_management_dialog.dart';

class EndDealManagementButton extends GetView<DealController> {
  const EndDealManagementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleIconButton(
        onTap: (){
          controller.clickManagement(
              context: context,
              isBuild: true
          );
        },
        iconSize: WidgetSize(context).sizedBox50,
        padding: WidgetSize(context).sizedBox5,
        icon: Icons.manage_history,
        iconColor: Style.blackWrite
    );

    //   RippleDecorationButton(
    //     onTap: (){
    //       controller.remoteList.addAll(SrcDealController.to.dealStatus.value.result.where((element) => element.diStatus != '진행중'));
    //       controller.remoteList.toSet();
    //       controller.scrollController = ScrollController();
    //       if(controller.remoteList.isEmpty){
    //         CommonWidgets().customSnackbar('종료된 딜이 없습니다.');
    //       } else{
    //         Future.delayed(Duration.zero, (){
    //           showDialog<String>(
    //               context: context,
    //               barrierDismissible: false,
    //               builder: (BuildContext context) =>
    //                   EndManagementDialog()
    //           );
    //         });
    //       }
    //     },
    //     color: Colors.transparent,
    //     padding: EdgeInsets.all(WidgetSize(context).sizedBox5),
    //     widget: Center(
    //       child: Text('관리하기', style: TextStyle(
    //           fontSize: WidgetSize(context).sizedBox16,
    //           fontWeight: FontWeight.w400,
    //           color: Style.greyAAAAAA
    //       ),),
    //     )
    // );
  }

}
