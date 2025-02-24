import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../components/custom_text_form.dart';
import '../../../../../../../../../../../components/disable_button.dart';
import '../../../../../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../../../../../css/app_basic_component/basic_app_bar_text.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';


class PasswordChangeDialog{
  passDialog(routerContext){
    Widget _heightPad12(){
      return SizedBox(height: WidgetSize(routerContext).sizedBox12,);
    }
    Widget _heightPad20(){
      return SizedBox(height: WidgetSize(routerContext).sizedBox20,);
    }

    Widget _textPx18w600Brown(String text, TextAlign? textAlign) {
      return Text(
        text,
        style: TextStyle(
          fontSize: WidgetSize(routerContext).sizedBox18,
          color: Style.brown,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign ?? TextAlign.center,
      );
    }

    Widget _textPx14w400Color(String text, Color? color, TextAlign textAlign, BuildContext context) {
      return Text(
        text,
        style: TextStyle(
          fontSize: WidgetSize(context).sizedBox14,
          color: color ?? Colors.black,
          fontWeight: FontWeight.w400,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign ?? TextAlign.center,
      );
    }

    return Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: routerContext,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox12))
                  ),
                  child: GetBuilder<EtcMyInfoSettingController>(
                    builder: (controller)=>
                        Container(
                          padding: EdgeInsets.all(WidgetSize(context).sizedBox12),
                          constraints: BoxConstraints(
                              minWidth: WidgetSize(context).widthCommon,
                              maxWidth: WidgetSize(context).widthCommon,
                              minHeight: WidgetSize(context).sizedBox0_6,
                              maxHeight: WidgetSize(context).sizedBox1_4
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        BasicAppBarText(text: '비밀번호 변경하기',),
                                        RippleDecorationButton(
                                            onTap: (){
                                              controller.initPass();
                                            },
                                            widget:  Icon(Icons.close, size: WidgetSize(context).sizedBox30, color: Style.blackWrite,)
                                        )
                                      ]
                                  ),
                                  _heightPad20(),
                                  _textPx18w600Brown('비밀번호는 5글자 이상,',TextAlign.left),
                                  _textPx18w600Brown('영문과 숫자 조합으로 설정해주세요.',TextAlign.left),
                                  _heightPad12(),
                                  CustomTextFormField(
                                    enabled: true,
                                    hintText: '비밀번호를 입력해주세요.',
                                    width: WidgetSize(context).widthCommon, onChanged: controller.inputPassword1, textController: controller.passwordTextField1,
                                    keyboardType: TextInputType.text,
                                    obscureText: controller.lock1.value,
                                    suffixIcon: RippleSearchIconButton(
                                        lock: controller.lock1.value,
                                        onTap: (){
                                          controller.lockDown1();
                                        }
                                    ),
                                  ),
                                  _heightPad12(),
                                  CustomTextFormField(
                                    enabled: true,
                                    hintText: '비밀번호를 한번 더 입력해주세요.',
                                    width: WidgetSize(context).widthCommon, onChanged: controller.inputPassword2, textController: controller.passwordTextField2,
                                    keyboardType: TextInputType.text,
                                    obscureText: controller.lock2.value,
                                    suffixIcon: RippleSearchIconButton(
                                        lock: controller.lock2.value,
                                        onTap: (){
                                          controller.lockDown2();
                                        }
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      _heightPad12(),
                                      controller.password1.value == controller.password2.value  && controller.password1.value != ''
                                          && controller.password2.value != '' && controller.validater()
                                          ?
                                      Column(
                                        children: [
                                          Padding(
                                            padding: WidgetSize(context).paddingBodyWhole,
                                            child: _textPx14w400Color('사용 가능한 비밀번호입니다', Colors.blue, TextAlign.left, context),
                                          ),
                                          _heightPad12(),
                                          NeumorphicButtons(text: '변경하기',
                                              height: WidgetSize(context).height60px-WidgetSize(context).sizedBox10,
                                              onPressed: () async{
                                                FocusScope.of(context).unfocus();
                                                await controller.changePw();
                                              }),
                                        ],
                                      )
                                          :
                                      Column(
                                        children: [
                                          Padding(
                                            padding: WidgetSize(context).paddingBodyWhole,
                                            child: _textPx14w400Color(controller.error.value, Colors.red, TextAlign.left, context),
                                          ),
                                          _heightPad12(),
                                          DisableButton(text: '변경하기', height: WidgetSize(context).height60px-WidgetSize(context).sizedBox10,)
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )

                            ],
                          ),
                        ),
                  )
              )
      );
    });

  }
}