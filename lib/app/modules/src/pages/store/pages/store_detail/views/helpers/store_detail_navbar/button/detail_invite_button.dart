import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../src_components/controllers/src_deal_controller.dart';
import '../../../../controllers/store_detail_controller.dart';

class DetailInviteButton extends GetView<StoreDetailController> {
  const DetailInviteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  ObxValue((detail) =>
        GestureDetector(
          onTap: AppOutsFunction().debounce(callback: SrcDealController.to.currentDealList.isEmpty
              ?  () async{
            if(Get.isSnackbarOpen){
              Get.back();
            }
            else{
              await controller.inviteDealDialog(context);
            }
          }
              :  detail.value.dealYN == 1
              ?  (){
            controller.commonWidgets.customDialogButton1(
                routerContext: context,
                onTap: () {
                  Get.back();
                },
                mainText: '이미 수락한 딜이 있어요.',
                buttonText: '확인'
            );
          }
              : detail.value.isDealing == 0
              ? () async{
            await controller.invitedStore2(smId: detail.value.smMId);
          }
              : detail.value.isDealing == 1
              ?  (){
            controller.commonWidgets.customDialogButton1(
                routerContext: context,
                onTap: () {
                  Get.back();
                },
                mainText: '이미 초대장을 받은 매장이에요.',
                buttonText: '확인'
            );
          }
              :  (){}),
          child: Container(
            height: WidgetSize(context).height60px,
            color: Style.brown,
            child: Center(
                child: Text('딜 초대하기'
                  ,style: TextStyle(fontSize: WidgetSize(context).sizedBox18, color: Style.yellow),
                )
            ),
          ),
        )
        , controller.storeDetail);
  }
}
