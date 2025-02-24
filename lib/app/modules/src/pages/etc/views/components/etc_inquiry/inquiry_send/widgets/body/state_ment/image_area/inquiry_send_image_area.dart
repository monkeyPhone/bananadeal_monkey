import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'inquiry_send_image.dart';

class InquirySendImageArea extends StatelessWidget {
  final List<CroppedFile?> imagePath;
  const InquirySendImageArea({
    required this.imagePath,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) =>
          InquirySendImage(
              imagePath: imagePath,
              index: index,
          )
      ),
    );
  }
}
