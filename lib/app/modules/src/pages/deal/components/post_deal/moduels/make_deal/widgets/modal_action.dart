import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/controllers/make_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal_body/body3/body3_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal_body/body7/body7_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../components/common_widgets.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../make_deal_body/body4/body4_controller.dart';
import '../../make_deal_body/body5/body5_controller.dart';
import '../../make_deal_body/body6/body6_controller.dart';

class ModalAction{
  Future modalOnTap(
      BuildContext context,
      ) {
    return showModalBottomSheet(
        isDismissible: false,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            color: Style.white,
            child: SafeArea(
              child: Container(
                color: Style.white,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: WidgetSize(context).sizedBox128,
                    maxHeight: WidgetSize(context).staticModalSize,
                    minWidth: WidgetSize(context).widthCommon,
                  ),
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      child: GetX<MakeDealController>(
                        builder: (MakeDealController controller) =>
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  controller.currentStep.value == 2
                                      ? controller.agency.length
                                      : controller.agency.length - 1,
                                      (index) =>
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () async{
                                                Body6Controller.to.initBody6();
                                                Body7Controller.to.initBody7();
                                                if (controller.currentStep.value == 2) {
                                                  controller.currentAgency.value =
                                                  controller.agency[index];
                                                  controller.currentAgencyN.value = controller.agencyNum[index];
                                                  Navigator.pop(context);
                                                }

                                                if (controller.currentStep.value == 3) {
                                                  try{
                                                    Body3Controller.to.check.value = 2;
                                                    controller.sellectAgency.value = controller.agency[index];
                                                    controller.agencyN.value = controller.agencyNum[index];
                                                    controller.requestAgencyN.value = controller.agencyNum[index];

                                                    if(controller.sellectAgency.value == controller.requestAgency.value){
                                                      controller.requestAgency.value = controller.sellectAgency.value;
                                                      Navigator.pop(context);
                                                    }
                                                    else{
                                                      controller.requestAgency.value = controller.sellectAgency.value;
                                                      controller.initPromotion();
                                                      if( MakeDealController.to.joinerPhoneIdx != ''){
                                                        await controller.initNextStep(index: index, context: context);
                                                      }else{
                                                        await controller.getGuyhap(context: context, tkIdx: controller.agencyNum[index]);
                                                      }
                                                    }
                                                  }catch(e){

                                                    Body3Controller.to.check.value = 0;
                                                    controller.requestAgency.value = '';
                                                    controller.agencyN.value = 0;
                                                    controller.requestAgencyN.value = 0;
                                                    controller.commonWidgets.customDialog(
                                                        routerContext: context,
                                                        mainText: '죄송해요! 해당 단말기 모델은 선택할 수 없는 통신사입니다.',
                                                        confirmText: '다른 통신사 선택하기',
                                                        conFirmOnTap: (){
                                                          Body3Controller.to.check.value = 0;
                                                          controller.requestAgency.value = '';
                                                          controller.agencyN.value = 0;
                                                          controller.requestAgencyN.value = 0;
                                                          Get.back();
                                                          },
                                                        isOne: true
                                                    );

                                                  }

                                                }

                                                },

                                              child: Container(
                                                height: WidgetSize(context).etc0156,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          width: WidgetSize(context).width00025,
                                                          color: Style.greyDDDDDD)
                                                  ),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                      controller.currentStep.value == 2 || controller.currentStep.value == 3
                                                          ? controller.agency[index]
                                                          : '',
                                                      style: TextStyle(
                                                          color: Style.blackWrite,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: WidgetSize(context).sizedBox14
                                                      ),
                                                    )
                                                ),
                                              ),
                                            ),
                                          )
                              ),
                            )
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

}