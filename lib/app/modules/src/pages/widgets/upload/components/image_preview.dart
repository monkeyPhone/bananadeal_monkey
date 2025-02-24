import 'dart:io';

import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/upload/components/photo_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/upload/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';

class ImagePreview extends GetView<UploadController> {
  ImagePreview({
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).height045,
        color:  Style.greyD3D3D3,
        child: controller.selectedImage.value == AssetEntity(
          id: '0',
          typeInt: 0,
          width: 0,
          height: 0,
        )
            ? Container()
            :
        controller.croppedFilePath.value == ''
            ?
            PhotoPreviewWidget(asset: controller.selectedImage.value, size: WidgetSize(context).widthCommon.toInt(),
                builder: (data){
                  return Image.memory(data, fit: BoxFit.cover,);
                }
            )
            :
        Image.file(File(controller.croppedFilePath.value), fit: BoxFit.cover,)
        ,
      ),
    );
  }


}
