import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/etc_my_info_quit/etc_my_info_quit.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_body/etc_info_body_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EtcInfoBody extends GetView<EtcMyInfoSettingController> {
  const EtcInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((quit) =>
        !quit.value
            ? EtcInfoBodyRoute()
            : EtcMyInfoQuit()
        , controller.clickQuit);
  }
}
