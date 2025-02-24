import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_change_auth_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/common/common_custom_text_dot.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/common/common_custom_text_form.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign_pad/sign_pad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../components/text_class/text_class.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../widgets/sign_domain_field.dart';

class SignChangeAreaToptext extends StatelessWidget {
  const SignChangeAreaToptext({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignView2ChangeAuthController>(
        builder: (controller) =>
        MediaQuery.of(context).viewInsets.bottom > 0 && controller.currentStep.value != 0
            ? SizedBox()
            : Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonCustomTextForm(
                    enabled: controller.currentStep.value == 0 || controller.checkMail.value.status != 200 || controller.checkMail.value.status == 0
                      ? true : false,
                    onChanged: controller.inputEmail,
                    textEditingController: controller.emailTextField
                ),
                CommonCustomTextDot(),
                !controller.domainSelected.value
                    ?   controller.currentStep.value == 0 || controller.checkMail.value.status != 200 || controller.checkMail.value.status == 0
                          ? SignDomainField(
                              textColor: controller.currentStep.value == 0 || controller.checkMail.value.status != 200 || controller.checkMail.value.status == 0
                                            ? Colors.black
                                            : Style.greyWrite,
                              color: controller.currentStep.value == 0 || controller.checkMail.value.status != 200 || controller.checkMail.value.status == 0
                                        ? Style.white
                                        : Style.greyD7D7D7,
                              text: controller.domain.value == ''
                                        ? Style.domain
                                        : controller.domain.value,
                              onTap: () async{
                                FocusScope.of(context).unfocus();
                                controller.currentStep.value == 0 || controller.checkMail.value.status != 200 || controller.checkMail.value.status == 0
                                    ? await controller.showModal(context)
                                    : null;
                                },
                            )
                          :  CommonCustomTextForm(
                                enabled: false,
                                onChanged: controller.inputDomain,
                                textEditingController: controller.domainTextField,
                                keyboardType: TextInputType.emailAddress,
                                hintText: controller.domain.value,
                              )

                    :  controller.currentStep.value == 0  || controller.checkMail.value.status != 200 || controller.checkMail.value.status == 0
                          ?  CommonCustomTextForm(
                                enabled: true,
                                onChanged: controller.inputDomain,
                                textEditingController: controller.domainTextField,
                                keyboardType: TextInputType.emailAddress,
                                hintText: controller.domain.value,
                                onTap: (){
                                  controller.whatTheButton();
                                },
                              )



                          :  CommonCustomTextForm(
                                enabled: false,
                                onChanged: controller.inputDomain,
                                textEditingController: controller.domainTextField,
                                keyboardType: TextInputType.emailAddress,
                                hintText: controller.domain.value,
                             )
              ],
            ),
            SignPad8(),
            Container(
              padding: WidgetSize(context).paddingBodyWhole,
              width: WidgetSize(context).widthCommon,
              child: Text14pxW400Color(
                text:
                controller.checkMail.value.status == 404
                    ? controller.checkMail.value.result.first.msg
                    : controller.status.value,
                color: controller.status.value == 'OK' || controller.status.value == '이메일 전송완료'
                    ? Colors.blue : Colors.red,
                textAlign: TextAlign.left ,
              ),
            ),
            SignPad8(),
          ],
        )
    );
  }
}
