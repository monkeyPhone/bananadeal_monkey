import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../../../css/size.dart';

class EtcInfoBottomNavBarQuit extends GetView<EtcMyInfoSettingController> {
  const EtcInfoBottomNavBarQuit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NeumorphicButtons(
            height: WidgetSize(context).height60px,
            text: '탈퇴하기',
            onPressed: () {
              controller.quitButtonClick(context);
        }),
      ],
    );
  }
}
