import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_body/etc_info_body_current/etc_info_body_current_crop/etc_info_body_current_crop_upload_card/etc_info_body_current_crop_upload_incase_thumb.dart';
import 'package:flutter/material.dart';

import 'etc_info_body_current_crop_upload_defalut.dart';

class EtcInfoBodyCurrentCropUploadCard extends StatelessWidget {
  final GestureTapCallback onTap;
  final String mPathImg;
  const EtcInfoBodyCurrentCropUploadCard({
    required this.onTap,
    required this.mPathImg,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RippleImageButton(
          borderRadius: BorderRadius.circular(999),
            image: mPathImg == ''
                ? EtcInfoBodyCurrentUploadDefault()
                : EtcInfoBodyCurrentCropUploadIncaseThumb(mPathImg: mPathImg),
            onTap: onTap
        ),
      ],
    );
  }
}
