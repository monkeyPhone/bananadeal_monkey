import 'package:banana_deal_by_monkeycompany/app/components/disable_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/neumorphic_buttons.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/controller/invite_deal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InviteNavBarChildren extends StatelessWidget {
  final bool isClose;
  const InviteNavBarChildren({super.key,
    required this.isClose
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InviteDealController>(

        builder: (controller) =>
        controller.watingSocket.value == 0
            ?  controller.invitedList.isNotEmpty
                    ?  NeumorphicButtons(
                          text: '견적 요청',
                          onPressed: () async{
                            if(Get.isSnackbarOpen){
                              Get.back();
                            }else{
                              await controller.postStore(null);
                              }
                            }
                         )
                    :   controller.allClick.value
                            ? NeumorphicButtons(
                                  text: '견적 요청',
                                  onPressed: () async{
                                    if(Get.isSnackbarOpen){
                                      Get.back();
                                    }else{
                                      await controller.postStoreAll();
                                     }
                                    }
                                  )

                            : NeumorphicButtons(
                                  text: isClose ? '돌아가기' : '나중에',
                                  onPressed: (){
                                    isClose ? Get.back()
                                        :
                                    controller.commonWidgets.customDialog(
                                      routerContext: context,
                                      barrierDismissible: false,
                                      mainText: '견적을 받아볼 매장을 선택하지 않았습니다.',
                                      mainText2: '정말 아무도 초대하지 않고 딜을 등록할까요?',
                                      caption: ('※ 아무도 초대하지 않고 딜을 등록하는 경우',
                                      '잊지 말고, 메인 화면에서 매장을 추가하세요.'),
                                      cancleText: '아니오', confirmText: '네',
                                      conFirmOnTap: () {
                                        if(Get.isSnackbarOpen){
                                          Get.back();
                                        } else{
                                          controller.changeComplete();
                                          Get.back();
                                          }
                                         },
                                      );
                                    }
                                  )

            : DisableButton(text: '잠시만 기다려주세요')
    );
  }
}
