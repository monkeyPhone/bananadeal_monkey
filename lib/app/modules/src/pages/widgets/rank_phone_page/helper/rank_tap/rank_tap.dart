import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/helper/rank_tap/rank_tap_list.dart';
import 'package:flutter/material.dart';

class RankTap extends StatelessWidget {
  final List content;
  final int currentTap;
  const RankTap({
    required this.content,
    required this.currentTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  RankTapList(
      content: List.generate(content.length, (index) => content[index]),
      currentTap:  currentTap,

    );
  }
}
