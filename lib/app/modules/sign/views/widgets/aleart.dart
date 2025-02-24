import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../css/size.dart';
import '../../../../css/style.dart';


class AlertMessage extends StatelessWidget {
  final String middleText1;
  final String middleText2;
  final String? middleText3;
  final String cancleText;
  final String confirmText;
  final GestureTapCallback onTapCancle;
  final GestureTapCallback onTapConfirm;
  AlertMessage({
    required this.middleText1,
    required this.middleText2,
    this.middleText3,
    required this.cancleText,
    required this.confirmText,
    required this.onTapCancle,
    required this.onTapConfirm,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox18),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: WidgetSize(context).sizedBox15,
              horizontal: WidgetSize(context).sizedBox6_5
          ),
          height: WidgetSize(context).widthCommon,
          width: WidgetSize(context).widthCommon,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: WidgetSize(context).sizedBox14
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: WidgetSize(context).widthCommon,
                          height: WidgetSize(context).height60px,
                          child: Center(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                text: TextSpan(
                                        text: middleText1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Style.brown,
                                          fontSize: WidgetSize(context).sizedBox20,
                                        )
                                ),
                              )
                          )
                      ),
                      middleText2 == '' &&  middleText3 == ''
                          ? _listTile('알 수 없음', '다른 장소를 선택해주세요.')
                          : SizedBox(height: WidgetSize(context).sizedBox9,),
                      middleText2 == ''
                          ? SizedBox()
                          :_listTile('도로명', middleText2),
                      middleText3 == ''
                          ? SizedBox()
                          :_listTile('지번', middleText3!),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: WidgetSize(context).height60px,
                child: Row(
                  children: [
                    Expanded(
                      child: RippleDecorationButton(
                          onTap: onTapCancle,
                          margin: EdgeInsets.all(WidgetSize(context).sizedBox8),
                          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox10),
                          border: Border.all(
                              color: Style.yellow,
                              width: WidgetSize(context).etc005
                          ),
                          widget: Center(
                              child: Text(cancleText,
                                style: TextStyle(
                                    color: Style.ultimateGrey,
                                    fontSize: WidgetSize(context).sizedBox18,
                                    fontWeight: FontWeight.w700),
                              )
                          ),
                      )
                    ),
                    Expanded(
                      child: RippleDecorationButtonColors(
                        onTap: onTapConfirm,
                          margin: EdgeInsets.all(WidgetSize(context).sizedBox8),
                          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox10),
                          border: Border.all(
                              color: Colors.transparent,
                              width: WidgetSize(context).etc005
                          ),
                          widget: Center(
                              child: Text(confirmText,
                                style: TextStyle(
                                    color: Style.brown,
                                    fontSize: WidgetSize(context).sizedBox18,
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
          ),
        ),
      ),
    );
  }

  Widget _listTile(String text, String addinfo) {
    return Expanded(
        child: Container(
          constraints: BoxConstraints(
              maxHeight: double.infinity,
              minWidth: WidgetSize(Get.context!).widthCommon
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: WidgetSize(Get.context!).sizedBox10,
                    vertical: WidgetSize(Get.context!).etc005
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Style.yellow,
                        width: WidgetSize(Get.context!).width00025
                    ),
                    borderRadius: BorderRadius.circular(
                        WidgetSize(Get.context!).sizedBox50
                    )
                ),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: WidgetSize(Get.context!).sizedBox16,
                      color: Style.brown,
                      fontWeight:  FontWeight.w400
                  ),
                ),
              ),
              SizedBox(
                  height: WidgetSize(Get.context!).sizedBox6_5
              ),
              Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(
                        WidgetSize(Get.context!).sizedBox4
                    ),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      strutStyle: StrutStyle(
                          fontSize: WidgetSize(Get.context!).sizedBox16
                      ),
                      text: TextSpan(
                          text:
                          addinfo,
                          style: TextStyle(
                            color: Style.blackWrite,
                            fontSize: WidgetSize(Get.context!).sizedBox16,
                          )),
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }
}
