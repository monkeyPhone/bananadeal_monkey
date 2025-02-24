import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_deal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../../../src_components/controllers/src_info_controller.dart';
import '../../../../controllers/etc_block_setting_controller.dart';

class BlockListDialogButton extends GetView<EtcBlockSettingController> {
  final String name;
  final int buIdx;
  const BlockListDialogButton({
    required this.name,
    required this.buIdx,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: (){
          controller.commonWidgets.customDialog(
              routerContext: context,
              barrierDismissible: false,
              mainText: '$name의 차단을 해제하시겠어요?',
              cancleText: '취소',
              confirmText: '차단 해제',
              conFirmOnTap: () async{
                if(Get.isSnackbarOpen){
                  Get.back();
                }
                else{
                  await controller.blockClear(buIdx);
                  await SrcDealController.to.getDealDataInits(SrcInfoController.to.infoM.value.mIdx.toInt());
                }
               }
              );
          },
        padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16, vertical: WidgetSize(context).sizedBox14),
        color: Style.yellow,
        borderRadius: BorderRadius.circular(WidgetSize(context).heightCommon),
        widget: Text(
            '차단 해제',
            style: TextStyle(
                fontSize: WidgetSize(context).sizedBox14,
                color:Style.brown,
                fontWeight: FontWeight.w400
            )
        )
    );
  }
}
