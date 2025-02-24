import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_detail_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_body_statement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../css/size.dart';


class PhoneDetailBodyCorrect extends GetView<SearchPhoneDetailController> {
  const PhoneDetailBodyCorrect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scrollbar(
            controller: controller.firstController,
            thumbVisibility: true,
            child: ListView(
              physics: const ClampingScrollPhysics(),
              controller: controller.firstController,
              children: [
                DetailBodyStateMent(),
                SizedBox(height: WidgetSize(context).height60px,)
              ],
            ),
          ),
        ),
        SizedBox(
          height: WidgetSize(context).extendsGap,
        )
      ],
    );
  }
}
