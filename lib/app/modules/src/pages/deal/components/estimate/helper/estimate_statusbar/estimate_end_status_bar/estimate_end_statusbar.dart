import 'package:banana_deal_by_monkeycompany/app/components/text_class/timer_text.dart';
import 'package:banana_deal_by_monkeycompany/app/models/nav/deal/deal_status.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_statusbar/estimate_end_status_bar/estimate_end_statusbar_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../views/widgets/custom_progress_indicator.dart';

class EstimateEndStatusBar extends StatelessWidget {
  final String dealStatus;
  const EstimateEndStatusBar({
    required this.dealStatus,
    super.key});

  @override
  Widget build(BuildContext context) {
    return TimerText();

    //   Stack(
    //   children: [
    //     StepProgressIndicator(
    //       totalSteps: 10,
    //       currentStep: 0,
    //       padding: 0,
    //       unselectedColor: Style.greyD9D9D9,
    //       selectedColor: Style.yellow,
    //       size: WidgetSize(context).sizedBox22,
    //       roundedEdges: Radius.circular(WidgetSize(context).sizedBox100),
    //     ),
    //     Positioned.fill(
    //         child: Align(
    //           alignment: Alignment.center,
    //           child: EstimateEndStatusBarText(
    //             dealStatus: dealStatus,
    //           ),
    //         )
    //     )
    //   ],
    // );
  }
}
