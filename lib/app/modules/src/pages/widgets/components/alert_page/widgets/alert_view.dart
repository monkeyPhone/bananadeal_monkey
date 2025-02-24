import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/helper/alert_app_bar/alert_app_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/helper/alert_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../../../../css/style.dart';
import 'alert_noti_controller.dart';
import 'helper/alert_tab_bar.dart';

class AlertView extends GetView<AlertNotiController> {
  const AlertView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: Column(
          children: [
            AlertAppbar(),
            AlertTapBar(),
            Expanded(
                child: Container(
                  color: Style.white,
                  child: SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                            child: AlertPage()
                        ),
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
        bottomNavigationBar: SizedBox());
  }


}
