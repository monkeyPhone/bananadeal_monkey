import 'package:banana_deal_by_monkeycompany/app/models/rank/rank_list.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/helper/rank_index_stack/rank_index_stack_list.dart';
import 'package:flutter/material.dart';

class RankIndexStack extends StatelessWidget {
  final int currentTap;
  final ScrollController allController;
  final List<Rankinfo> currentRank;

  const RankIndexStack({
    required this.currentTap,
    required this.allController,
    required this.currentRank,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  RankIndexStackList(
        scrollController: allController,
        rank: List<Rankinfo>.generate( currentRank.length, (index) => currentRank[index]).toList()
    );
  }
}
