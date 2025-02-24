import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_change_auth_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign_pad/sign_pad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/custom_text_form.dart';
import '../../../../../../../../components/disable_button.dart';
import '../../../../../../../../components/text_class/text_class.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class SignChangeSendEmail extends GetView<SignView2ChangeAuthController> {
  final int currentStep;
  final int countDown;
  const SignChangeSendEmail({super.key, required this.currentStep, required this.countDown});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      child: Column(
        children: [
          currentStep == 1 && MediaQuery.of(context).viewInsets.bottom>0
              ? SizedBox()
              : DisableButton(text: '이메일 인증 진행중입니다.'),
          currentStep == 1 && MediaQuery.of(context).viewInsets.bottom>0
              ? SizedBox()
              : SignPad28(),
        ],
      ),
    );
  }
}
