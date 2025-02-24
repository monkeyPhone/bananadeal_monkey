import 'package:banana_deal_by_monkeycompany/app/components/future_builder_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/body/some_inquiry_correct.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/etc_some_inquiry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SomeInquiryBody extends GetView<EtcSomeInquiryController> {
  const SomeInquiryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderWidget(
        future: controller.getQuestionList(),
        nextWidget: SomeInquiryCorrect()
    );

  }
}
