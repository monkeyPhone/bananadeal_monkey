import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_body/etc_info_body_current/etc_info_body_current_crop/etc_info_body_current_crop_upload_card/etc_info_body_current_crop_upload_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'etc_info_body_current_crop_image_card/etc_info_body_current_crop_image_card.dart';

class EtcInfoBodyCurrentCrop extends StatelessWidget {
  final String mPathImg;
  const EtcInfoBodyCurrentCrop({
    required this.mPathImg,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtcMyInfoSettingController>(
      builder: (controller) {
        if (controller.croppedFilePath.value != '' || controller.pickedFilePath.value != '') {
          return EtcInfoBodyCurrentCropImageCard(
            onTap: (){
              controller.init();
            },
            croppedFilePath: controller.croppedFilePath.value,
            pickedFilePath: controller.pickedFilePath.value,
          );
        } else {
          return EtcInfoBodyCurrentCropUploadCard(
            onTap: (){
              controller.cropDown();
            },
            mPathImg: mPathImg,
          );
        }
      }
    );
  }
}
