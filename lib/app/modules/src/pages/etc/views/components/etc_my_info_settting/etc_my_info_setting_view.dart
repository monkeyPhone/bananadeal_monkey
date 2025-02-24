import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/bottom_nav_bar/etc_info_bottom_nav_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_app_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_body/etc_info_body.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/loading_progressbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/etc_my_info_setting_controller.dart';


class EtcMyInfoSettingView extends GetView<EtcMyInfoSettingController> {
  const EtcMyInfoSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              controller.closeCrop();
            },
            child: BasicCanvas(
              canPop: true,
              body: Column(
                children: [
                  EtcInfoAppBar(),
                  Expanded(
                      child: EtcInfoBody()
                  )
              ],
            ),
              bottomNavigationBar: EtcInfoBottomNavBar(),
            )

        ),
        LoadingProgressBar()
      ],
    );
  }

}

