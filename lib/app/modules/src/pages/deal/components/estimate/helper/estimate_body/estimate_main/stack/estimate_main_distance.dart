import 'package:flutter/material.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/nav/deal/deal_estimate.dart';

class EstimateMainDistance extends StatelessWidget {
  final DealEstimateList selectEstimate;
  const EstimateMainDistance({
    required this.selectEstimate,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      selectEstimate.distance < 1.0
          ?
      '${(selectEstimate.distance*1000).roundToDouble().toInt()}m'
          :
      '${(selectEstimate.distance).toStringAsFixed(2)}km',
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox14,
          fontWeight: FontWeight.w400,
          color: Style.white
      ),
    );
  }
}
