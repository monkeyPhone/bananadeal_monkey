import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../css/size.dart';

class UploadDialog {
  void openDialog({required Widget image, required BuildContext context})
  {
    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: context,
          builder: (BuildContext context) =>
              GestureDetector(
                onTap: Get.back,
                child: InteractiveViewer(
                    maxScale: 2.5,
                    minScale: 0.8,
                    constrained: false,
                    child: SizedBox(
                      width: WidgetSize(context).widthCommon,
                      height: WidgetSize(context).heightCommon,
                      child: Center(
                        child: ClipRRect(
                            child: image
                        ),
                      ),
                    )
                ),
              )
      );
    });
  }
}