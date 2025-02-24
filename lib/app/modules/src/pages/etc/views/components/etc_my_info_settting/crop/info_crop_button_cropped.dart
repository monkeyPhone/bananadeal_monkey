import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'info_crop_ripple.dart';

class InfoCropButtonCropped extends GetView<EtcMyInfoSettingController> {
  final List buttonName2;
  final List icon2;
  final List color2;
  const InfoCropButtonCropped({
    required this.buttonName2,
    required this.icon2,
    required this.color2,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children:
      List.generate(3,
              (index) =>
          index == 0
              ?
          SizedBox()
              :
          InfoCropRipple(
            onTap: (){
              controller.cropButtonCropped(index);
            },
            buttonName: buttonName2,
            icon: icon2, color: color2,
            index: index,
          )
      )
    );
  }
}
