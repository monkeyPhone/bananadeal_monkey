import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/crop/Info_crop_button_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EtcInfoBodyRoutePosition extends GetView<EtcMyInfoSettingController> {
  const EtcInfoBodyRoutePosition({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (p0) =>
                !p0.value
                    ? const SizedBox()
                    : InfoCropButtonView()
        , controller.crop);
  }
}