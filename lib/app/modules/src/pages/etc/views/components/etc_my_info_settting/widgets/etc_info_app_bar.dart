import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../../css/app_basic_component/basic_app_bar_text.dart';

class EtcInfoAppBar extends GetView<EtcMyInfoSettingController> {
  const EtcInfoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (click) => BasicAppbar(
              leading: !click.value ? (){
                Get.back();
              } : (){
                controller.clickQuickPush();
              },
              title: BasicAppBarText(
                text: !click.value ? '내 정보' : '회원 탈퇴',
              ),
            ), controller.clickQuit);
  }
}
