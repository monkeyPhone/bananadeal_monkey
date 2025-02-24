import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/estimate_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/appbar/estimate_appbar_actions.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/appbar/estimate_appbar_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstimateAppbarArea extends GetView<EstimatedController> {
  final int diIdx;

  const EstimateAppbarArea({
    super.key,
    required this.diIdx,
  });

  @override
  Widget build(BuildContext context) {
    return ObxValue(
        (status) =>
            BasicAppbar(
                title: EstimateAppbarText(currentDeal: controller.currentDeal, ),
                actions: EstimateAppbarActions(dealStatus: status.value, diIdx: diIdx,)
            ),controller.estimateStatus);
  }
}
