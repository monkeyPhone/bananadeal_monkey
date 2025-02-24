import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_change_auth_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/sign_change_auth/helper/change_area/sign_change_find_email.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/sign_change_auth/helper/change_area/sign_change_pass_form.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/sign_change_auth/helper/change_area/sign_change_send_email.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign_pad/sign_pad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../components/disable_button.dart';
import '../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../components/sub_button.dart';
import '../../../../../../../components/text_class/text_class.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import 'change_area/sign_change_area_toptext.dart';

class SignChangeArea extends StatelessWidget {
  final String email;
  final String domain;
  const SignChangeArea({super.key,
    required this.email,
    required this.domain,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignView2ChangeAuthController>(
        builder: (controller) =>
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                controller.currentStep.value == 2
                ?  SignPad8()
                    :
                domain == '' && email == ''
                    ? SignChangeAreaToptext()
                    : SignChangeFindEmail(email: email, domain: domain, currentStep: controller.currentStep.value,),

                SignPad8(),

                controller.domain.value != '' && controller.eamil.value != ''  && controller.domain.value.contains('.')
                  ? controller.currentStep.value == 2
                    ? SignChangePassForm()
                    : NeumorphicButtons(text: '다음',
                    onPressed: () async{
                      FocusScope.of(context).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                      await controller.checkEmail(context);
                    }
                )
                    : DisableButton(text: '이메일 입력을 완료해주세요'),
              ],
            )
    );
  }
}
