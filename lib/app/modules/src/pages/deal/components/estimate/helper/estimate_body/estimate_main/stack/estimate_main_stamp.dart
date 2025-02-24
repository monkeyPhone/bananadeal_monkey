import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../models/nav/deal/deal_estimate.dart';

class EstimateMainStamp extends StatelessWidget {
  final DealEstimateList selectEstimate;
  const EstimateMainStamp({
    required this.selectEstimate,
    super.key});

  @override
  Widget build(BuildContext context) {
    return selectEstimate.dStatus == 'ACCEPT' || selectEstimate.dStatus == 'OPEN'
        ? AssetImageBox(imageHeight: WidgetSize(context).sizedBox84, imageWidth: WidgetSize(context).sizedBox100, imageUrl: AppElement.stampStek)
        : const SizedBox();
  }
}
