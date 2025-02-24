import 'package:banana_deal_by_monkeycompany/app/components/future_builder_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/etc_inquiry_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/inquiry_body/inquiry_main/inquiry_main_correct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InquiryMain extends GetView<EtcInquiryController> {
  const InquiryMain({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderWidget(
        future: controller.getQuestionList(),
        nextWidget: InquiryMainCorrect()
    );
  }
}
