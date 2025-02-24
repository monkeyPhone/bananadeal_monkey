import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/submission/submission_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/make_deal_controller.dart';
import 'helper/make_deal/make_deal.dart';

class MakeDealView extends GetView<MakeDealController> {
  const MakeDealView({
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObxValue((page) =>
    page.value >= 10
          ? SubmissionView()
          : MakeDeal(page: page.value,),
        controller.currentStep);
  }
}
