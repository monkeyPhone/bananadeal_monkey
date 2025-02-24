import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../components/custom_text_form.dart';
import '../../../../../../../../../../../components/disable_button.dart';
import '../../../../../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../../../../../css/app_basic_component/basic_app_bar_text.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';

class NickNameChangeDialog{
  nickDialog({required routerContext, required String name}){
    Widget _heightPad8(){
      return SizedBox(height: WidgetSize(routerContext).sizedBox8,);
    }
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

    Widget _textPx18w600Black(String text, TextAlign? textAlign) {
      return Text(
        text,
        style: TextStyle(
          fontSize: WidgetSize(routerContext).sizedBox18,
          color: Style.blackWrite,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign ?? TextAlign.center,
      );
    }


    return Future.delayed(Duration.zero, (){
      showDialog<String>(
          barrierDismissible: false,
          context: routerContext,
          builder: (BuildContext context) =>
              Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox12))
                ),
                child: GetBuilder<EtcMyInfoSettingController>(
                  builder: (controller)=>
                      GestureDetector(
                        onTap: (){
                          controller.focus.unfocus();
                        },
                        child: Container(
                          padding: EdgeInsets.all(WidgetSize(context).sizedBox12),
                          constraints: BoxConstraints(
                              minWidth: WidgetSize(context).widthCommon,
                              maxWidth: WidgetSize(context).widthCommon,
                              minHeight: WidgetSize(context).width06,
                              maxHeight: WidgetSize(context).sizedBox1_4
                          ),
                          child: SingleChildScrollView(
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
                                          BasicAppBarText(text: '닉네임 변경하기',),
                                          RippleDecorationButton(
                                              onTap: (){
                                                controller.initNick();
                                              },
                                              widget: Icon(Icons.close, size: WidgetSize(context).sizedBox30, color: Style.blackWrite,),
                                          )
                                        ]
                                    ),
                                    _heightPad20(),
                                    _textPx18w600Brown('변경 전', TextAlign.left),
                                    _heightPad8(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        _textPx18w600Black(name, TextAlign.left),
                                        !controller.okSign.value
                                            ?  Container(
                                                padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox7_5, horizontal: WidgetSize(context).sizedBox12),
                                                decoration: BoxDecoration(
                                                color: Style.white,
                                                borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox32),
                                                ),
                                                child: Text('중복체크',
                                                  style: TextStyle(
                                                      color: Style.white,
                                                      fontSize: WidgetSize(context).sizedBox14
                                                  ),
                                                ),
                                               )
                                            : RippleDecorationButton(
                                                 onTap:  () async{
                                                   await controller.sendName(controller.nickName.value);
                                                 },
                                                 padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox7_5, horizontal: WidgetSize(context).sizedBox12),
                                                 color: Style.yellow,
                                                 borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox32),
                                                 widget: Text('중복체크',
                                                   style: TextStyle(
                                                       color: Style.brown,
                                                       fontSize: WidgetSize(context).sizedBox14
                                                   ),
                                                 )
                                               )
                                      ],
                                    ),
                                    _heightPad12(),
                                    CustomTextFormField(
                                      focusNode: controller.focus,
                                      width: WidgetSize(context).widthCommon,
                                      onChanged: controller.inputNick,
                                      textController: controller.nicknameController,
                                      hintText: '닉네임을 입력해주세요.',
                                      enabled: true,
                                      keyboardType: TextInputType.name,
                                    ),
                                    SizedBox(height: WidgetSize(context).sizedBox8,),
                                    controller.nickName.value != '' && controller.validate.value == '사용 가능한 닉네임이에요.'
                                        ? controller.loading.value == ''
                                        ? Column(
                                      children: [
                                        Padding(
                                          padding: WidgetSize(context).paddingBodyWhole,
                                          child: _textPx14w400Color('사용 가능한 닉네임이에요.', Colors.blue, TextAlign.left, context),
                                        ),
                                        _heightPad12(),
                                        NeumorphicButtons(text: '변경하기',
                                            height: WidgetSize(context).height60px-WidgetSize(context).sizedBox10,
                                            onPressed: () async{
                                              FocusScope.of(context).unfocus();
                                              await controller.changeNick(controller.nickName.value);}
                                        )
                                      ],
                                    )
                                        : Column(
                                      children: [
                                        Padding(
                                          padding: WidgetSize(context).paddingBodyWhole,
                                          child: _textPx14w400Color(controller.validate.value, Colors.red, TextAlign.left, context),
                                        ),
                                        _heightPad12(),
                                        DisableButton(text: '잠시만 기다려주세요.', height: WidgetSize(context).height60px-WidgetSize(context).sizedBox10,)
                                      ],
                                    )
                                        : Column(
                                      children: [
                                        Padding(
                                          padding: WidgetSize(context).paddingBodyWhole,
                                          child: _textPx14w400Color(controller.validate.value, Colors.red, TextAlign.left, context),
                                        ),
                                        _heightPad12(),
                                        DisableButton(text: '변경하기', height: WidgetSize(context).height60px-WidgetSize(context).sizedBox10,)
                                      ],
                                    ),
                                  ],
                                )

                              ],
                            ),
                          ),
                        ),
                      )
                  ,
                ),
              )
      );
    });
  }
}