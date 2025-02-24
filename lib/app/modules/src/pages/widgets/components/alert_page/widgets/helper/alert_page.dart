import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/alert_noti_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/deal_active/deal_active_view.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/etc_active/etc_active_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlertNotiController>(
      builder: (anC){
        return anC.currentTap.value == 0
            ? DealActiveView()
            : EtcActiveView();
      },
    );
  }
}
