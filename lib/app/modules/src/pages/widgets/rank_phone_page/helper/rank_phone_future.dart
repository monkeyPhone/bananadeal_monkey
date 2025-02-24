import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/common/search_phone_future.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/helper/rank_index_stack/rank_index_stack.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/rank_phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../components/default_banana.dart';
import '../../../../../../models/rank/rank_list.dart';

class RankPhoneFuture extends GetView<RankPhoneController> {
  final int currentTap;
  final ScrollController allController;
  final List<Rankinfo> currentRank;
  final bool error;
  const RankPhoneFuture({
    required this.currentTap,
    required this.allController,
    required this.currentRank,
    required this.error,
    super.key});

  @override
  Widget build(BuildContext context) {
    return currentRank.isEmpty
              ? error
                  ?  DefaultBanana(
                      onPressed: ()async{
                        await controller.getRank(currentTap);
                      },
                     )
                  :  SearchPhoneFuture(
                      future: controller.getRank(currentTap),
                      successWidget: SizedBox()
                     )
              : RankIndexStack(
                   currentTap: currentTap,
                   allController: allController,
                   currentRank: currentRank,

    );

      // SearchPhoneFuture(future: future, successWidget: successWidget);

  }
}
