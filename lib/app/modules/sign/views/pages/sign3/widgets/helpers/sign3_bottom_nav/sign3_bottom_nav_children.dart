import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_3_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/disable_button.dart';
import '../../../../../../../../components/neumorphic_buttons.dart';

class Sign3BottomNavChildren extends GetView<SignView3Controller> {
  const Sign3BottomNavChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (confirm) => confirm.value
                ? NeumorphicButtons(
                    text: '다음',
                    onPressed: () {
                     controller.confirmButton();
                     },
                  )
                : DisableButton(text: '프로필 설정을 완료해주세요.'),
        controller.confirm);
  }
}
