import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/body/widgets/some_inquiry_correct_column_image.dart';
import 'package:flutter/material.dart';

class SomeInquiryCorrectColumnIamgeArea extends StatelessWidget {
  final List imageList;
  const SomeInquiryCorrectColumnIamgeArea({
    required this.imageList,
    super.key});

  @override
  Widget build(BuildContext context) {
    return imageList.isNotEmpty
        ?
    Column(
      children: List.generate(imageList.length, (index) =>
         SomeInquiryCorrectColumnImage(imagePath: imageList[index])
      ),
    )
        :
    SizedBox();
  }
}
