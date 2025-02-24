import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';

class ReservationAlertDialog {

  void openAddressDialog() {
    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: Get.context!,
          builder: (BuildContext context) =>
              PopScope(
                canPop: false,
                onPopInvoked: (bool didPop) async{
                  if(didPop){
                    return;
                  }
                },
                child: Dialog(
                  backgroundColor: Style.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).dialogCircular))
                  ),
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: WidgetSize(context).height60px3n1, horizontal: WidgetSize(context).sizedBox12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '이미 해당 판매점에게 수락한 딜이 존재합니다',
                                  style: TextStyle(
                                      color: Style.blackWrite,
                                      fontWeight: FontWeight.w400,
                                      fontSize: WidgetSize(Get.context!).sizedBox17
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: WidgetSize(context).sizedBox3,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '방문요청 완료 시 해당판매점에 수락된 딜은',
                                  style: TextStyle(
                                      color: Style.blackWrite,
                                      fontWeight: FontWeight.w400,
                                      fontSize: WidgetSize(Get.context!).sizedBox17
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: WidgetSize(context).sizedBox3,
                              ),
                              Text(
                                '자동 종료됩니다',
                                style: TextStyle(
                                    color: Style.blackWrite,
                                    fontWeight: FontWeight.w400,
                                    fontSize: WidgetSize(Get.context!).sizedBox17
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          height: WidgetSize(context).height60px,
                          child: RippleDecorationButton(
                              onTap: (){
                                Get.back();
                              },
                              color: Style.yellow,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(WidgetSize(context).dialogCircular),
                                  bottomRight: Radius.circular(WidgetSize(context).dialogCircular)
                              ),
                              widget: Center(
                                child: Text(
                                  '확인',
                                  style: TextStyle(
                                      color: Style.brown,
                                      fontWeight: FontWeight.w400,
                                      fontSize: WidgetSize(context).dialogString
                                  ),
                                ),
                              )
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              )
      );
    });
  }

}