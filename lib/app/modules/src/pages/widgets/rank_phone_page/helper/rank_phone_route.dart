import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/helper/rank_phone_future.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/helper/rank_tap/rank_tap.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/rank_phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../css/size.dart';

class RankPhoneRoute extends StatelessWidget {
  const RankPhoneRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RankPhoneController>(
        builder: (RankPhoneController controller) =>
            Column(
              children: [
                RankTap(
                  content: controller.content,
                  currentTap: controller.currentTap.value,
                ),
                SizedBox(height: WidgetSize(context).sizedBox6,),
                Expanded(
                  child: RankPhoneFuture(
                    currentTap: controller.currentTap.value,
                    allController: controller.allController,
                    currentRank: controller.currentRank,
                    error: controller.error.value,
                  )
                ),
              ],
            )
    );
  }
}
