import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../src_components/src_body/false_alert.dart';

class IosAlertIconView extends GetView<SrcInfoController> {
  const IosAlertIconView({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((not) =>
        not.value ? FalseAlert()
                  : SizedBox()
        , controller.notiValue);
  }
}
