import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/helper/rank_tap/rank_tap_menu.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/rank_phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../css/size.dart';

class RankTapList extends GetView<RankPhoneController> {
  final List content;
  final int currentTap;
  const RankTapList({
    required this.content,
    required this.currentTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).sizedBox50,
      width: WidgetSize(context).widthCommon,
      child: ListView(
          padding: WidgetSize(context).paddingBodyWhole,
          controller: controller.firstController,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            RankTapMenu(
              content: content,
              currentTap: currentTap,
              )
            ],
          ),
    );

  }
}
