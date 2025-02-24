import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/components/neumorphic_buttons.dart';
import 'package:banana_deal_by_monkeycompany/app/components/sub_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/estimate_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/controller/reservation_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../models/nav/deal/deal_estimate.dart';

class ReservationLastButtonArea extends StatelessWidget {
  final DealEstimateList? estimate;
  const ReservationLastButtonArea({
    super.key,
    required this.estimate,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReservationController>(
      builder: (controller) =>
          controller.storeName.value == ''
              ? Padding(
            padding:  EdgeInsets.only(
                left: WidgetSize(context).sizedBox16,
                right: WidgetSize(context).sizedBox16,
                bottom: WidgetSize(context).sizedBox16),
            child: NeumorphicButtons(
              onPressed: () async{
                if(Get.isSnackbarOpen){
                  Get.back();
                } else{
                  Get.back();
                  estimate != null ? Get.back() : null;
                }
              },
              text: '돌아가기',
            ),
          )
              :
          Padding(
            padding:  EdgeInsets.only(bottom: WidgetSize(context).sizedBox32),
            child: SizedBox(
              width: WidgetSize(context).widthCommon,
              height: WidgetSize(context).height60px,
              child: controller.loading.value
                  ? Center(
                child: CircularProgressIndicator(
                  color: Style.progressBar,
                ),
              )
                  :
              Row(
                children: [
                  SizedBox(
                    width: WidgetSize(context).sizedBox16,
                  ),
                  Expanded(
                    child: RippleDecorationButton(
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(width: WidgetSize(context).sizedBox1, color: Style.ultimateGrey),
                        onTap: (){
                          if(Get.isSnackbarOpen){
                            Get.back();
                          } else{
                            Get.back();
                            estimate != null ? Get.back() : null;
                          }
                        },
                        widget: Center(
                          child: Text('취소',
                            style: TextStyle(
                                fontSize: WidgetSize(context).sizedBox22,
                                fontWeight: FontWeight.w500,
                                color: Style.blackWrite
                            ),
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    width: WidgetSize(context).sizedBox16,
                  ),
                  Expanded(
                    child: RippleDecorationButton(
                        border: Border.all(width: WidgetSize(context).sizedBox1, color: Style.yellow),
                        borderRadius: BorderRadius.circular(999),
                        color: Style.yellow,
                        onTap: () async{
                          if(Get.isSnackbarOpen){
                            Get.back();
                          } else{
                            FocusScope.of(context).unfocus();
                            if(controller.reservationPeople.value == '' || controller.reservationName.value == '' || controller.reservationPhone.value == ''){
                              controller.commonWidgets.customSnackbar('필수 방문정보를 입력해주세요.');
                            }
                            else if(!controller.confirm.value){
                              controller.commonWidgets.customSnackbar('개인정보 제3자 제공에 동의해주세요.');
                            }
                            else{
                              try{
                                if(estimate != null){
                                  controller.setLoading();
                                  await controller.makeCache();
                                  await EstimatedController.to.sendReservation(estimate: estimate!, context: context, smName: controller.storeName.value);
                                }
                                else{
                                  controller.setLoading();
                                  await controller.makeCache();
                                  Get.back();
                                  ChatLogController.to.reservationChange();
                                }
                              } catch(e){
                                controller.closeLoading();
                              }
                            }
                          }
                        },
                        widget: Center(
                          child: Text('등록',
                            style: TextStyle(
                                fontSize: WidgetSize(context).sizedBox22,
                                fontWeight: FontWeight.w500,
                                color: Style.blackWrite
                            ),
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    width: WidgetSize(context).sizedBox16,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
