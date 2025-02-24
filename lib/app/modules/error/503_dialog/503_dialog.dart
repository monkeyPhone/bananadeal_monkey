import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/error/503_dialog/dialog_503_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../css/size.dart';

class Dialog503{
  static customErrorDialog({
    required int errorCode, required String errorRouter
  }){
    String errorMsg(){
      switch(errorCode){
        case 506:
          return '서버 연결 지연';
        case 507:
          return '서버 연결 끊김';
        default:
          return '기타';
      }
    }
    String errorResult(){
      switch(errorCode){
        case 506:
        case 507:
          return '서버와의 재연결을 시도중입니다. \n잠시만 기다려주세요. \n\n(일시적 오류이거나 네트워크 문제일 수 있으니, 와이파이 혹은 셀룰러데이터 상태를 확인해주세요.)';
        default:
          return '기타';
      }
    }
    return Get.dialog(
        barrierDismissible: false,
        PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) {
            if(didPop){
              return;
            }
          },
          child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(WidgetSize(Get.context!).sizedBox12))
            ),
            child: GetX<Dialog503Controller>(
                builder: (controller) {
                  controller.errorValue.value = errorRouter;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: WidgetSize(Get.context!).paddingBodyWhole,
                        height: WidgetSize(Get.context!).sizedBox72,
                        child: Row(
                          children: [
                            Text(
                              !controller.internetStatus.value
                                  ? errorMsg() : '연결 성공',
                              style: TextStyle(color: Style.blackWrite, fontWeight: FontWeight.w700, fontSize: WidgetSize(Get.context!).sizedBox22),)
                          ],
                        ),
                      ),
                      Container(
                        height: WidgetSize(Get.context!).width001,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Style.yellow,
                                    width: WidgetSize(Get.context!).sizedBox2*2
                                )
                            )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: WidgetSize(Get.context!).sizedBox32, horizontal: WidgetSize(Get.context!).sizedBox24),
                        constraints: BoxConstraints(
                          minHeight: WidgetSize(Get.context!).sizedBox144,
                          maxHeight: WidgetSize(Get.context!).heightCommon,
                        ),
                        child:

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            SizedBox(height: WidgetSize(Get.context!).sizedBox16,),
                            Text(errorResult(),
                              style: TextStyle(
                                fontSize: WidgetSize(Get.context!).sizedBox20,
                                fontWeight: FontWeight.w500,
                                color: Style.blackWrite
                              ),
                            ),
                          ],
                        )
                      ),
                      Container(
                        height: WidgetSize(Get.context!).sizedBox72,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(WidgetSize(Get.context!).sizedBox10),
                                  decoration: BoxDecoration(
                                      color: Style.yellow,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(WidgetSize(Get.context!).sizedBox12),
                                          bottomRight: Radius.circular(WidgetSize(Get.context!).sizedBox12)
                                      )
                                  ),
                                  child: Center(
                                    child:
                                    !controller.internetStatus.value ?
                                    CircularProgressIndicator(color: Style.white,): SizedBox(),
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
            ),
          ),
        )
    );
  }
}