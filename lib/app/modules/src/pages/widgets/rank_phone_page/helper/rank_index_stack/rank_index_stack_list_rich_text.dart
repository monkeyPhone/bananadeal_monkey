import 'package:flutter/material.dart';

import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../models/rank/rank_list.dart';

class RankIndexStackListRichText extends StatelessWidget {
  final Rankinfo rank;
  const RankIndexStackListRichText({
    required this.rank,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.start,
      text: TextSpan(
        text: rank.psName,
        style: TextStyle(
          fontWeight:
          FontWeight.w700,
          color: Style.blackWrite,
          fontSize:
          rank.psName.length > 18
              ?  WidgetSize(context).sizedBox12
              :  WidgetSize(context).sizedBox14,
        ),
      ),
    );
  }
}
