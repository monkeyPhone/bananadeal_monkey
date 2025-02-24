import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/alert_noti_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/custom_tap_bar.dart';
import '../../../../../../src_components/controllers/src_noti_controller.dart';

class AlertTapBar extends StatelessWidget {
  const AlertTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlertNotiController>(
        builder:  (anC){
          return CustomTapBarStack(
            tabController: anC.tabController,
            tap1: '딜 알림 (${anC.notiDeal.length})', tap2: '전체 알림 (${anC.notiEtc.length})', tapLeft: anC.dealBadge.value, tapRight: anC.etcBadge.value,
          );
        }
    );
  }
}
