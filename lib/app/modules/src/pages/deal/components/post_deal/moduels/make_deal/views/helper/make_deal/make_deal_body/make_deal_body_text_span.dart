import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/controllers/make_deal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';

class MakeDealBodyRichText extends GetView<MakeDealController> {
  final int page;
  const MakeDealBodyRichText({
    required this.page,
    super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      textAlign: TextAlign.center,
      text: TextSpan(
        text: controller.stepTopCenterTitle[page],
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Style.blackWrite,
          fontSize: WidgetSize(context).sizedBox24,
        ),
      ),
    );
  }
}
