import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_spec_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_telecom_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';



class SearchDialog {

  void openDetailImageDialog({required BuildContext routerContext, required Widget image}){
    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: routerContext,
          builder: (BuildContext context) =>
              GestureDetector(
                onTap: Get.back,
                child: InteractiveViewer(
                    maxScale: 2.5,
                    minScale: 0.8,
                    constrained: false,
                    child: ClipRRect(
                        child: image
                    )
                ),
              )
      );
    });
  }


  void openNewbieDialog({
    required BuildContext routerContext,
    required int index,
  }){
    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: routerContext,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              Dialog(
                backgroundColor: Style.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox8))
                ),
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
                  height: WidgetSize(context).textFromWidth,
                  child: Center(
                    child: GetBuilder<SearchPhoneSpecController>(
                      builder: (SearchPhoneSpecController controller) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                flex: 8,
                                fit: FlexFit.tight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '선택한 단말기가 맞으신가요?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: WidgetSize(context).sizedBox20
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: WidgetSize(context).sizedBox16,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: WidgetSize(context).sizedBox16
                                      ),
                                      child: Text(
                                        "'${controller.showDatas
                                            .value
                                            .list[index]
                                            .psName}'",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: WidgetSize(context).sizedBox24
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 3,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: RippleDecorationButtonColors(
                                      onTap: Get.back,
                                      color: Style.white,
                                      borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox8),
                                      margin: EdgeInsets.all(WidgetSize(context).width0021),
                                      border: Border.all(width: WidgetSize(context).width0007, color: Style.yellow),
                                      widget: Center(
                                          child: Text('취소하기',
                                            style: TextStyle(
                                                color: Style.ultimateGrey,
                                                fontSize: WidgetSize(context).width0045,
                                                fontWeight: FontWeight.w700
                                            ),
                                          )
                                      ),
                                    )
                                  ),
                                  Expanded(
                                    child:  RippleDecorationButton(
                                    onTap: (){
                                      if(Get.isSnackbarOpen){
                                        Get.back();
                                      } else{
                                        controller.dialogClick(index);
                                        Get.back();
                                        Get.back();
                                        }
                                      },
                                      color: Style.yellow,
                                      borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox8),
                                      margin: EdgeInsets.all(WidgetSize(context).width0021),
                                      border: Border.all(width: WidgetSize(context).width0007, color: Style.yellow),
                                      widget: Center(
                                          child: Text('선택하기',
                                            style: TextStyle(
                                                color: Style.brown,
                                                fontSize: WidgetSize(context).sizedBox20,
                                                fontWeight: FontWeight.w700
                                            ),
                                          )
                                      ),
                                    )
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },),
                  ),
                ),
              )
      );
    });
  }

  void openTelecomDialog({
    required BuildContext routerContext,
    required int index,
  }) {
    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: routerContext,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              Dialog(
                backgroundColor: Style.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox8))
                ),
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
                  height: WidgetSize(context).textFromWidth,
                  child: Center(
                    child: GetBuilder<SearchPhoneTelecomController>(
                      builder: (SearchPhoneTelecomController controller){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                flex: 8,
                                fit: FlexFit.tight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '선택한 단말기가 맞으신가요?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: WidgetSize(context).sizedBox20
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: WidgetSize(context).sizedBox16,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: WidgetSize(context).sizedBox16
                                      ),
                                      child: Text(
                                        "'${controller.phoneDatas
                                            .value
                                            .list[index]
                                            .psName}'",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: WidgetSize(context).sizedBox24
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 3,
                              child: Row(
                                children: [
                                  Expanded(
                                      child:
                                      RippleDecorationButton(
                                        onTap: Get.back,
                                        margin: EdgeInsets.all(WidgetSize(context).width0021),
                                        borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox8),
                                        border: Border.all(width: WidgetSize(context).width0007, color: Style.yellow),
                                        widget: Center(
                                            child: Text('취소하기',
                                              style: TextStyle(
                                                  color: Style.ultimateGrey,
                                                  fontSize: WidgetSize(context).width0045,
                                                  fontWeight: FontWeight.w700
                                              ),
                                            )
                                        ),
                                      )
                                  ),
                                  Expanded(
                                    child: RippleDecorationButtonColors(
                                        onTap:  (){
                                          if(Get.isSnackbarOpen){
                                            Get.back();
                                          }
                                          else{
                                            controller.dialogClick(index);
                                            Get.back();
                                            Get.back();
                                           }
                                          },
                                        margin: EdgeInsets.all(WidgetSize(context).width0021),
                                        borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox8),
                                        widget: Center(
                                            child: Text('선택하기',
                                              style: TextStyle(
                                                  color: Style.brown,
                                                  fontSize: WidgetSize(context).sizedBox20,
                                                  fontWeight: FontWeight.w700
                                              ),
                                            )
                                        )
                                    )
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              )
      );
    });
  }

}