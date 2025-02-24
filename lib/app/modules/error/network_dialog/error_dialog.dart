import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/error/network_dialog/error_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../css/size.dart';
import '../../main/auth/auth_controller.dart';

class ErrorDialog{
  static void customErrorDialog({
    required int errorCode, required String errorRouter
  }){
    String errorMsg(){
      switch(errorCode){
        case 505:
          return '인터넷 연결 없음';
        default:
          return '기타';
      }
    }
    String errorResult(){
      switch(errorCode){
        case 505:
          return '모바일 데이터 혹은 WIFI의 연결 상태를 확인해 주세요. \n\n이상이 없다면, 비행기 모드를 끄시거나, VPN 연결을 해제하고 다시 시도 해주세요.';
        default:
          return '기타';
      }
    }
    if(Get.isDialogOpen == false){
      Get.dialog(
          barrierDismissible: false,
          PopScope(
            canPop: false,
            onPopInvokedWithResult:(bool didPop, Object? result){
              if(didPop){
                return;
              }
            },
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(WidgetSize(Get.context!).sizedBox12))
              ),
              child: GetX<ErrorController>(
                  builder: (controller) {
                    controller.errorValue.value = errorRouter;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: WidgetSize(Get.context!).paddingBodyWhole,
                          height: WidgetSize(Get.context!).sizedBox72,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                !controller.internetStatus.value ? errorMsg() : '연결 성공',
                                style: TextStyle(color: Style.blackWrite, fontWeight: FontWeight.w700, fontSize: WidgetSize(Get.context!).sizedBox20),),
                              // controller.loadingStatus.value == false
                              //     ?
                              FaIcon(
                                FontAwesomeIcons.wifi,
                                size: WidgetSize(Get.context!).sizedBox20,
                                color: !controller.internetStatus.value ? Style.red : Colors.blue,
                              )
                            ],

                          ),
                        ),
                        Container(
                          height: WidgetSize(Get.context!).width001,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Style.yellow,
                                      width: WidgetSize(Get.context!).sizedBox3
                                  )
                              )
                          ),
                        ),
                        !controller.failClose.value
                            ?
                        Container(
                            padding: EdgeInsets.symmetric(vertical: WidgetSize(Get.context!).sizedBox45, horizontal: WidgetSize(Get.context!).sizedBox24),
                            constraints: BoxConstraints(
                              minHeight:
                              WidgetSize(Get.context!).sizedBox144,
                              maxHeight: WidgetSize(Get.context!).heightCommon,
                            ),
                            child:

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                !controller.internetStatus.value
                                    ?
                                Text(errorResult(), style: TextStyle(
                                    fontSize: WidgetSize(Get.context!).sizedBox20,
                                    fontWeight: FontWeight.w400,
                                    color: Style.blackWrite
                                ),
                                )
                                    :
                                !controller.failClose.value
                                    ?
                                Column(
                                  children: [
                                    SizedBox(
                                      height: WidgetSize(Get.context!).sizedBox34,
                                    ),
                                    CircularProgressIndicator(color: Style.yellow,),
                                    SizedBox(
                                      height: WidgetSize(Get.context!).sizedBox72,
                                    ),
                                  ],
                                ) : SizedBox(),

                              ],
                            )
                        ) : SizedBox(),
                        !controller.failClose.value
                            ? SizedBox()
                            : GestureDetector(
                            onTap: (){
                              AuthController.to.deleteServer();
                              Get.back();
                            },
                            child: Container(
                              width: WidgetSize(Get.context!).widthCommon,
                              height: WidgetSize(Get.context!).height60px,
                              decoration: BoxDecoration(
                                  color: Style.yellow,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(WidgetSize(Get.context!).sizedBox12),
                                      bottomRight: Radius.circular(WidgetSize(Get.context!).sizedBox12)
                                  )
                              ),
                              child: Center(
                                child: Text('닫기', style: TextStyle(
                                    fontSize: WidgetSize(Get.context!).sizedBox20,
                                    fontWeight: FontWeight.w400,
                                    color: Style.brown
                                ),
                                ),
                              ),
                            )
                        )
                      ],
                    );
                  }
              ),
            ),
          )
      );
    }
  }
}