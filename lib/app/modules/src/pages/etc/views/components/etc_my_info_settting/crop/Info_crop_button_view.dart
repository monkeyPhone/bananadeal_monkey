import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/crop/info_crop_button_cropped.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/crop/info_crop_button_no_cropped.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class InfoCropButtonView extends StatelessWidget {
  const InfoCropButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: WidgetSize(context).sizedBox10, right: WidgetSize(context).sizedBox10, left: WidgetSize(context).sizedBox10),
      decoration: BoxDecoration(
          color: Style.white,
          border: Border.all(color: Colors.grey.shade300, width: WidgetSize(context).sizedBox1),
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox10)
      ),
      child: GetBuilder<EtcMyInfoSettingController>(
        builder: (controller)=>
          controller.croppedFilePath.value != ''
              ?  InfoCropButtonCropped(
                   buttonName2: controller.buttonName2,
                   color2: controller.color2,
                   icon2: controller.icon2,
                 )

              : InfoCropButtonNoCropped(
                   buttonName: controller.buttonName,
                    color: controller.color,
                    icon: controller.icon,
                  )
      ),
    );
  }
}
