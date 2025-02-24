import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import 'etc_info_body_current_crop_image_card_image.dart';

class EtcInfoBodyCurrentCropImageCard extends StatelessWidget {
  final GestureTapCallback onTap;
  final String croppedFilePath;
  final String pickedFilePath;
  const EtcInfoBodyCurrentCropImageCard({
    required this.onTap,
    required this.croppedFilePath,
    required this.pickedFilePath,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RippleImageButton(
          borderRadius: BorderRadius.circular(999),
          image: EtcInfoBodyCurrentCropImageCardImage(
            croppedFilePath: croppedFilePath,
            pickedFilePath: pickedFilePath,
          ),
          onTap: onTap
      ),
    );
  }
}
