import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/common/common_custom_text_dot.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/common/common_custom_text_form.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign_pad/sign_pad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../components/custom_text_form.dart';
import '../../../../../../../../../components/disable_button.dart';
import '../../../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../../../components/text_class/text_class.dart';
import '../../../../../../../../../components/widget_components/ripple_button/ripple_search_icon_button.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../sign_domain_field.dart';

class SignLoginFormArea extends StatelessWidget {
  const SignLoginFormArea({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignView2Controller>(
        builder: (controller) =>
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonCustomTextForm(
                        textEditingController: controller.emailTextField,
                        enabled: true, onChanged: controller.inputEmail
                    ),
                    CommonCustomTextDot(),
                    !controller.domainSelected.value
                        ? SignDomainField(
                      textColor: Colors.black,
                      color: Style.white,
                      onTap: () async{
                        FocusScope.of(context).unfocus();
                        await controller.showModal(context);
                      },
                      text: controller.domain.value == ''
                          ? Style.domain
                          : controller.domain.value,
                    )
                        :

                    CommonCustomTextForm(
                        textEditingController: controller.domainTextField,
                        keyboardType: TextInputType.emailAddress,
                        onTap: (){
                          FocusScope.of(context).unfocus();
                          controller.whatTheButton();
                        },
                        enabled: true, onChanged: controller.inputDomain
                    ),
                  ],
                ),
                SignPad18(),
                CustomTextFormField(
                    width: WidgetSize(context).widthCommon,
                    onChanged: controller.inputPassword,
                    textController: controller.passwordTextField,
                    keyboardType: TextInputType.text,
                    enabled: true,
                    obscureText: controller.lock.value,
                    suffixIcon: RippleSearchIconButton(
                      lock: controller.lock.value,
                      onTap: (){
                        controller.loginLockButton();
                      },
                    )


                ),
                SignPad8(),
                Text14pxW400Color(
                  text: controller.status.value != ''
                      ? controller.status.value
                      : controller.loginStatus.value,
                  color: Style.red,
                  textAlign: TextAlign.left,
                ),
                SignPad8(),
                controller.waitLoginStatus.value == 0
                  ? NeumorphicButtons(
                    text: '로그인',
                    onPressed: () async{
                      final bool next = await controller.checkServerStatus();
                      if(next == true){
                        await controller.getLogin(context: context, email: controller.eamil.value, domain: controller.domain.value, password: controller.password );
                      }
                    }
                )
                    : DisableButton(text: '로그인 진행중입니다')
              ],
            )
    );
  }
}
