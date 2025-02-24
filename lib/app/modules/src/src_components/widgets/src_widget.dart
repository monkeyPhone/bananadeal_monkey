import 'package:banana_deal_by_monkeycompany/app/components/image_provider/image_provider_state.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/sub_button.dart';
import '../../../../css/size.dart';
import '../../../../css/style.dart';
import '../../../../models/src/banner/src_popup.dart';
import '../../../../routes/api_url.dart';
import '../../../../routes/const_element.dart';
import '../../../main/auth/auth_controller.dart';
import '../controllers/src_banner_controller.dart';

class SrcWidget{
  void showBottomSheet({required BuildContext context, required int index, required List<SrcPopupList> popup}) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(WidgetSize(context).sizedBox18),
          topRight: Radius.circular(WidgetSize(context).sizedBox18)
        )
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: WidgetSize(context).sizedBox8,
          ),
          decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(WidgetSize(context).sizedBox18),
              topRight: Radius.circular(WidgetSize(context).sizedBox18),
            )
          ),
          child: SafeArea(
            child: GetBuilder<SrcBannerController>(
                builder: (controller)=> Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: WidgetSize(context).sizedBox16, right: WidgetSize(context).sizedBox8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '잠깐! 놓치면 아쉬운 소식이에요',
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox20),
                              textAlign: TextAlign.start,
                            ),
                            RippleDecorationButton(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                widget: Icon(Icons.close, size: WidgetSize(context).sizedBox30, color: Colors.black,)
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox6_5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            controller.currentPopup.value == 0
                                ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox7_5),
                              child: Text('이전',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: WidgetSize(context).sizedBox16,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                                :
                            RippleDecorationButton(
                                onTap: (){
                                  controller.minusDegreed();
                                },
                              padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox7_5),
                                widget: Text('이전',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: WidgetSize(context).sizedBox16,
                                      fontWeight: FontWeight.w700),
                                ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox6_5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        controller.popupList[controller.currentPopup.value].pmTitle,
                                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox19),
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            controller.popupList.length-1 == controller.currentPopup.value
                            ?
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox7_5),
                                  child: Text('다음',
                                    style: TextStyle(
                                        color:  Colors.white,
                                        fontSize: WidgetSize(context).sizedBox16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                                :
                            RippleDecorationButton(
                                onTap: (){
                                  controller.plusDegreed();
                                },
                                padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox7_5),
                                widget: Text('다음',
                                  style: TextStyle(
                                      color:  Colors.blue,
                                      fontSize: WidgetSize(context).sizedBox16,
                                      fontWeight: FontWeight.w700),
                                ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox8),
                        child: ImageProviderState(imageUrl: ApiConsole.imageBananaUrl+controller.popupList[controller.currentPopup.value].pmPathImg,
                            errUrl: AppElement.defaultImg, imageWidth: WidgetSize(context).widthCommon, aspectRatio: AppElement.caseNotice),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: RippleDecorationButton(
                          onTap: (){
                            AuthController.to.hidePage();
                            Get.back();
                            //AuthController.to.changeBan(banner[currentBanner.value].pmIdx.toString());
                          },
                          widget:  Padding(
                            padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox3),
                            child: Center(
                                child: Text(
                                  '오늘 하루 그만 보기',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: WidgetSize(context).sizedBox14,
                                      fontWeight: FontWeight.w400),
                                )
                            ),
                          )
                        ),
                      ),

                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: WidgetSize(context).sizedBox16,
                              right: WidgetSize(context).sizedBox16,
                          ),
                          child:
                          SubButton(onTap: (){
                            controller.functionRouterByPopupIdx(controller.currentPopup.value, context);
                          }, text: '자세히보기', backGroundColor: Style.yellow, textSize: WidgetSize(context).sizedBox17, fontWeight: FontWeight.w700, textColor: Style.brown,),
                          // NeumorphicButtons(text: '자세히보기', onPressed: (){}, height: WidgetSize(context).sizedBox45, textWidget: Center(child: CommonWidgets().textPx17w600Brown('자세히보기',)
                          //   )
                          // )
                        )),
                    SizedBox(
                      height: GetPlatform.isAndroid || (GetPlatform.isIOS && SrcInfoController.to.infoM.value.mModel == 'iPhone SE (2nd generation)')
                          ? WidgetSize(context).sizedBox8 : 0,

                    )
                  ],)
            ),
          ),
        );
      },
    );
  }
}