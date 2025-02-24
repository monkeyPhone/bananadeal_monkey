import 'dart:io';

import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/inquiry_send_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../../../../../../../../../../../css/size.dart';

class InquirySendCorrectImageArea extends GetView<InquirySendController> {
  final List<CroppedFile?> imagePath;
  final int index;
  const InquirySendCorrectImageArea({
    required this.imagePath,
    required this.index,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: WidgetSize(context).sizedBox22),
      child: RippleImageButton(
        onTap: (){
          controller.switchRouteCaseDelete(
              context: context,
              index: index
          );
        },
        image:  Image.file(
          File(imagePath[index]!.path), fit: BoxFit.cover, width: WidgetSize(context).sizedBox170,
          height: WidgetSize(context).sizedBox170/1.618,),
      ),
    );
  }
}
