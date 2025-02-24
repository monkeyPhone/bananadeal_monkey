import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/widgets/inquiry_image_area.dart';
import 'package:flutter/material.dart';

class InquiryColumnImageListArea extends StatelessWidget {
  final List imageList;
  const InquiryColumnImageListArea({
    required this.imageList,
    super.key});

  @override
  Widget build(BuildContext context) {
    return imageList.isNotEmpty
            ?  SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(imageList.length, (index) =>
                      InquiryImageArea(imagePath: imageList[index], me: true,)
                  ),
                ),
              )
            : SizedBox();
  }
}
