import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/crop/info_crop_ripple.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoCropButtonNoCropped extends GetView<EtcMyInfoSettingController> {
  final List buttonName;
  final List icon;
  final List color;
  const InfoCropButtonNoCropped({
    required this.buttonName,
    required this.icon,
    required this.color,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      List.generate(
          4, (index) =>
      index == 0
          ? SizedBox()
          : InfoCropRipple(
              onTap: (){
                controller.cropButtonNoCropped(index);
                },
              buttonName: buttonName,
              icon: icon, color: color,
              index: index,
        )
      ),
    );
  }
}
