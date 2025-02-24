import 'package:flutter/material.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/nav/deal/deal_estimate.dart';

class EstimateMainDesuggestion extends StatelessWidget {
  final DealEstimateList selectEstimate;
  const EstimateMainDesuggestion({
    required this.selectEstimate,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${selectEstimate.deSuggestions}',
      style:
      selectEstimate.dStatus == 'PARTICIPATE' || selectEstimate.dStatus == 'OPEN' || selectEstimate.dStatus == 'ACCEPT'
          ? TextStyle(
          fontSize: WidgetSize(context).sizedBox12,
          fontWeight: FontWeight.w400,
          color: Style.blackWrite
      )
          : TextStyle(
          fontSize: WidgetSize(context).sizedBox12,
          fontWeight: FontWeight.w400,
          color: Style.grey999999
      )
      ,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
