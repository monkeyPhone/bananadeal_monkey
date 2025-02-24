import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_4_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sign4ReactiveSizedBox extends StatelessWidget {
  double widgetHeight;
    Sign4ReactiveSizedBox({
      required this.widgetHeight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SignView4Controller>(
      builder: (controller){
        return SizedBox(
          height: controller.longtitude.value == '' && controller.latitude.value == '' && controller.dong.value == '' && controller.addr.value == ''
              ? widgetHeight
              : 0,
        );
      },
    );
  }
}
