import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_change_auth_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign_pad/sign_pad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/custom_text_form.dart';
import '../../../../../../../../components/disable_button.dart';
import '../../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../../components/text_class/text_class.dart';
import '../../../../../../../../components/widget_components/ripple_button/ripple_search_icon_button.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class SignChangePassForm extends StatelessWidget {
  const SignChangePassForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignView2ChangeAuthController>(
        builder: (controller) =>
            Container(
              color: Style.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    enabled: true,
                    hintText: '비밀번호를 입력해주세요.',
                    width: WidgetSize(context).widthCommon, onChanged: controller.inputPassword1, textController: controller.passwordTextField1,
                    keyboardType: TextInputType.text,
                    obscureText: controller.lock1.value,
                    suffixIcon: RippleSearchIconButton(
                      lock: controller.lock1.value,
                      onTap: (){
                        controller.changeLock();
                      },
                    ),

                  ),
                  SignPad12(),
                  CustomTextFormField(
                      enabled: true,
                      hintText: '비밀번호를 한번 더 입력해주세요.',
                      width: WidgetSize(context).widthCommon, onChanged: controller.inputPassword2, textController: controller.passwordTextField2,
                      keyboardType: TextInputType.text,
                      obscureText: controller.lock2.value,
                      suffixIcon: RippleSearchIconButton(
                        lock: controller.lock2.value,
                        onTap: (){
                          controller.changeLock2();
                        },
                      )
                  ),
                  Column(
                    children: [
                      SignPad12(),
                      Row(
                        children: [
                          SignWidthPad(),
                          Text14pxW400Color(
                            text: '비밀번호는 5글자 이상 영어 소문자 + 숫자로 이루어져야 합니다.',
                            color: Style.brown,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SignPad12(),
                      controller.password1.value == controller.password2.value  && controller.password1.value != ''
                          && controller.password2.value != '' && controller.validate()
                          ? Column(
                        children: [
                          Row(
                            children: [
                              SignWidthPad(),
                              Text14pxW400Color(
                                text: '사용 가능한 비밀번호입니다',
                                color: Colors.blue,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          SignPad12(),
                          NeumorphicButtons(
                              text: '비밀번호 변경',
                              onPressed: () async{
                                FocusScope.of(context).unfocus();
                                if(Get.isSnackbarOpen){
                                  Get.back();
                                }
                                else{
                                  await controller.changePw();
                                }
                              }
                          ),
                        ],
                      )
                          : Column(
                        children: [
                          Row(
                            children: [
                              SignWidthPad(),
                              Text14pxW400Color(
                                text: controller.error.value,
                                color: Style.red,
                                textAlign: TextAlign.left,
                              ),
                            ] ,
                          ),
                          SignPad12(),
                          DisableButton(text: '비밀번호 변경')
                        ],
                      ),
                    ],
                  )

                ],
              ),
            )
    );
  }
}
