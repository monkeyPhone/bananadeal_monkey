import 'package:banana_deal_by_monkeycompany/app/components/future_builder_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_detail_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_body_correct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneDetailBody extends GetView<SearchPhoneDetailController> {
  final int psIdex;
  const PhoneDetailBody({
    required this.psIdex,
    super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderWidget(
        future: controller.getModelDetail(psIdex),
        nextWidget: PhoneDetailBodyCorrect()
    );
  }
}
