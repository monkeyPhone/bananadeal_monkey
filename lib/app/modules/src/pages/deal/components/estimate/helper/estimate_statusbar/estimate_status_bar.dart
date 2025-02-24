import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/estimate_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_statusbar/estimate_end_status_bar/estimate_end_statusbar.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const/const_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../models/nav/deal/deal_status.dart';
import 'count_down_timer_page.dart';

class EstimateStatusbar extends StatelessWidget {
  final String dealStatus;
  final DealStatusList currentDeal;

  const EstimateStatusbar({
    required this.dealStatus,
    required this.currentDeal,
    super.key});

  @override
  Widget build(BuildContext context) {

    return  dealStatus != '진행중'
        ?  SizedBox()
        : Padding(
      padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16, vertical: WidgetSize(context).sizedBox3),
      child:
      GetBuilder<EstimatedController>(
        builder: (controller)=>
         controller.durations.value <= Duration(hours: 48) && currentDeal.diStatus == InfoString.dealStatusIng
                  ? CountDownTimerPage(
                      presetMilliseconds1: currentDeal.diRegdate,
                    )
                  : EstimateEndStatusBar(
                      dealStatus: dealStatus
                    )
      )
    );
  }
}
