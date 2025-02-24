import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';

class EtcInfoBodyCurrentCropImageCardImage extends StatelessWidget {
  final String croppedFilePath;
  final String pickedFilePath;
  const EtcInfoBodyCurrentCropImageCardImage({
    required this.croppedFilePath,
    required this.pickedFilePath,
    super.key});

  @override
  Widget build(BuildContext context) {
    if (croppedFilePath != '') {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
              width: WidgetSize(context).sizedBox1,
              color: Style.greyC4C4C4
          ),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child:  Image.file(File(croppedFilePath), fit: BoxFit.cover, height: WidgetSize(context).sizedBox136, width: WidgetSize(context).sizedBox136,),

            )

        ),
      );
    } else if (pickedFilePath != '') {
      return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
              width: WidgetSize(context).sizedBox1,
              color: Style.greyC4C4C4
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: Container(
            color: Style.white,
            height: WidgetSize(context).sizedBox136, width: WidgetSize(context).sizedBox136,
          ),

        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
