import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_block_setting/helper/etc_block_setting_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../components/custom_tap_bar.dart';
import '../../../../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../controllers/etc_block_setting_controller.dart';


class EtcBlockSettingView extends GetView<EtcBlockSettingController> {
  const EtcBlockSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: Column(
          children: [
            BasicAppbar(
                title: Text(
                  '차단 관리',
                  style: TextStyle(
                      color: Style.blackWrite,
                      fontSize: WidgetSize(context).sizedBox24,
                      fontWeight: FontWeight.w700
                  ),
                )
            ),
            CustomTapBar(tabController: controller.tabController, tap1: '매장 차단 목록', tap2: '유저 차단 목록',),
            Expanded(
                child: EtcBlockSettingBody()
            )
          ],
        ),
        bottomNavigationBar: SafeArea(
            child: SizedBox()
        )
    );

  }

}
