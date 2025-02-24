import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_3_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';



class Sign3ImageCardArea extends GetView<SignView3Controller> {
  const Sign3ImageCardArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: (){
            controller.imageCardAction(context);
          },
          child: GestureDetector(
            onTap: (){
              controller.crop.value =! controller.crop.value;
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: WidgetSize(context).sizedBox1, color: Style.grey999999),
                  borderRadius: BorderRadius.circular(999)
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: Image.file(File(controller.imagePath[0]!.path), fit: BoxFit.cover, height: WidgetSize(context).sizedBox121, width: WidgetSize(context).sizedBox121,)
              ),
            ),
          )
      )
    );
  }

}
