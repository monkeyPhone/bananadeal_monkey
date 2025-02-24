import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/style.dart';
import '../../../naver_marker_controller.dart';

class InitPositionIcon extends GetView<NaverMarkerController> {
  const InitPositionIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return RippleIconButton(
        onTap: () async{
          await controller.myPosition();
        },
        icon: Icons.settings_backup_restore,
        iconColor: Style.crowdFlower
    );
  }
}
