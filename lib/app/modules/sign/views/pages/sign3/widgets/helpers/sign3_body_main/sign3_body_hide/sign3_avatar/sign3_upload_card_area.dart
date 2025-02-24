import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_3_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../../css/size.dart';


class Sign3UploadCardArea extends GetView<SignView3Controller> {
  const Sign3UploadCardArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            controller.crop.value =! controller.crop.value;
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: AssetImageBox(
              imageHeight: WidgetSize(context).sizedBox121,
              imageWidth: WidgetSize(context).sizedBox121,
              imageUrl: AppElement.defaultThumb,
              boxFit: BoxFit.cover,
            ),
          ),
        ),

      ],
    );
  }
}
