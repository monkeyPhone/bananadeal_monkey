import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_body_helper/detail_image_area_helper/detail_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../models/deal/model_detail_data.dart';

class DetailImageArea extends StatelessWidget {
  final int currentColor;
  final int itemCount;
  final List<PhoneImg> phoneImg;
  const DetailImageArea({
    required this.currentColor,
    required this.itemCount,
    required this.phoneImg,
    super.key});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentColor,
      children: List.generate(
          itemCount,
              (index) => DetailImage(imageUrl: phoneImg[currentColor].piPath,)
      ),
    );

  }
}
