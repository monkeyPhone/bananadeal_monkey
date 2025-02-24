import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/helper/rank_index_stack/rank_index_stack_list_coulmn.dart';
import 'package:flutter/material.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../models/rank/rank_list.dart';

class RankIndexStackList extends StatelessWidget {
  final ScrollController scrollController;
  final List<Rankinfo> rank;
  const RankIndexStackList({
    required this.scrollController,
    required this.rank,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: ListView(
          controller: scrollController,
          physics: ClampingScrollPhysics(),
          padding: WidgetSize(context).paddingBodyWhole,
          children: [
            RankIndexStackListColumn(ranks: rank, )
          ],

      )
    );
  }
}
