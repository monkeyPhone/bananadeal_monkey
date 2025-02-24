import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/etc_some_inquiry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../css/style.dart';

class EtcSomeInquiryNavbar extends GetView<EtcSomeInquiryController> {
  const EtcSomeInquiryNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (p0) => Container(
          color:
          p0.isEmpty ? Style.white : Style.greyF4F4F4,
          child: SafeArea(
            child: SizedBox(),
          ),
        ), controller.currentQuestionList);
  }
}
