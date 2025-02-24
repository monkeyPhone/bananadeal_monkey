import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/estimate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/nav/deal/deal_estimate.dart';

class EstimateMainDetailButton extends GetView<EstimatedController> {
  final DealEstimateList selectEstimate;
  const EstimateMainDetailButton({
    required this.selectEstimate,
    super.key});

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: (){
          controller.clickEstimateDetailButton(estimate: selectEstimate);
        },
        color: Style.yellow,
        borderRadius: BorderRadius.circular(999),
        width: WidgetSize(context).sizedBox84,
        height: WidgetSize(context).sizedBox40,
        widget: Center(
            child: Text('상세보기',
              style: TextStyle(
                  color: Style.brown,
                  fontWeight: FontWeight.w400, fontSize: WidgetSize(context).sizedBox14
              ),
            )
        ),
    );
  }
}
