import 'package:flutter/material.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/nav/deal/deal_estimate.dart';

class EstimateMainStorename extends StatelessWidget {
  final DealEstimateList selectEstimate;
  const EstimateMainStorename({
    required this.selectEstimate,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      selectEstimate.smStoreName,
      style:
      selectEstimate.dStatus == 'PARTICIPATE' || selectEstimate.dStatus == 'OPEN' || selectEstimate.dStatus == 'ACCEPT'
        ? TextStyle(
          fontSize: WidgetSize(context).sizedBox16,
          fontWeight: FontWeight.w700,
          color: Style.blackWrite
      )
        : TextStyle(
          fontSize: WidgetSize(context).sizedBox16,
          fontWeight: FontWeight.w700,
          color: Style.ultimateGrey
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
