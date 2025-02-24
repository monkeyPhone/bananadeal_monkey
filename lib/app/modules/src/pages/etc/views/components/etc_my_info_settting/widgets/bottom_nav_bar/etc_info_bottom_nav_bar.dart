import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/bottom_nav_bar/etc_info_bottom_nav_bar_current.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/bottom_nav_bar/etc_info_bottom_nav_bar_quit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../routes/const_element.dart';

class EtcInfoBottomNavBar extends GetView<EtcMyInfoSettingController> {
  const EtcInfoBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      child: SafeArea(
        child: Container(
          padding: WidgetSize(context).paddingBodyWhole,
          color: Style.white,
          width: WidgetSize(context).widthCommon,
          height: AppElement.defaultBottomPadding,
          child: ObxValue(
              (quit)=> !quit.value
                  ? EtcInfoBottomNavBarCurrent()
                  : EtcInfoBottomNavBarQuit()
          ,controller.clickQuit)
        ),
      ),
    );
  }
}
