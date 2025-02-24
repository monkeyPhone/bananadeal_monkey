import 'package:flutter/material.dart';
import '../../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../models/nav/deal/deal_status.dart';
import '../../../../../../../../../../routes/const_element.dart';

class DealListEndScrollBarItemMainImageArea extends StatelessWidget {
  final List<DealStatusList>  dealStatus;
  final int index;
  const DealListEndScrollBarItemMainImageArea({
    required this.dealStatus,
    required this.index,
    super.key});

  @override
  Widget build(BuildContext context) {
    return dealStatus[index].diHopePhoneImg != ''
        ?
    ImageProviders(
        imageWidth: WidgetSize(context).sizedBox119,
        imageHeight: WidgetSize(context).sizedBox121,
        imageUrl: dealStatus[index].diHopePhoneImg,
        errUrl: AppElement.defaultPhone,
        imageLabel: AppElement.caseHeight
    )
        :
    AssetImageBox(imageHeight: WidgetSize(context).heightCommon, imageWidth: WidgetSize(context).widthCommon,
        imageUrl: AppElement.defaultPhone
    );
  }
}
