import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/widgets/inquiry_image_area.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../css/size.dart';

class InquiryCommentImageArea extends StatelessWidget {
  final List imageListC;
  const InquiryCommentImageArea({
    required this.imageListC,
    super.key});

  @override
  Widget build(BuildContext context) {
    return imageListC.isNotEmpty
            ? Column(
              children: [
                SizedBox(
                  height: WidgetSize(context).sizedBox16,
                ),
                ...List.generate(imageListC.length, (index) =>
                    InquiryImageArea(imagePath: imageListC[index], me: false,)
                ).toList(),
              ]
            )
            : const SizedBox();
  }
}
