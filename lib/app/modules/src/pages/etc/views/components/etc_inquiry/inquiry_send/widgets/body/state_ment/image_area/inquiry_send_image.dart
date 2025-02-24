import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/widgets/body/state_ment/image_area/inquiry_send_correct_image_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/widgets/body/state_ment/image_area/inquiry_send_default_image_area.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class InquirySendImage extends StatelessWidget {
  final List<CroppedFile?> imagePath;
  final int index;
  const InquirySendImage({
    required this.imagePath,
    required this.index,
    super.key});

  @override
  Widget build(BuildContext context) {
    return imagePath[index] == null
        ? InquirySendDefaultImageArea(index: index)
        : InquirySendCorrectImageArea(imagePath: imagePath, index: index);
  }
}
