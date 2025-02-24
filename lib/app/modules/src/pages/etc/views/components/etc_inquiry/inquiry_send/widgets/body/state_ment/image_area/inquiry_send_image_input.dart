import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/widgets/body/state_ment/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../../../../../../../../../../../css/size.dart';
import 'inquiry_send_image_area.dart';

class InquirySendImageInput extends StatelessWidget {
  final List<CroppedFile?> imagePath;
  const InquirySendImageInput({
    required this.imagePath,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalText(text: '첨부 이미지 (최대 3장)'),
          SizedBox(height: WidgetSize(context).sizedBox12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: InquirySendImageArea(imagePath: imagePath,),
          ),
        ],
      ),
    );
  }
}
