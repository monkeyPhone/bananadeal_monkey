import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../../../controllers/sign_view_3_controller.dart';

class CropButtonViewSign extends GetView<SignView3Controller> {
  const CropButtonViewSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.only(top: WidgetSize(context).sizedBox8, right: WidgetSize(context).sizedBox8, left: WidgetSize(context).sizedBox8),
        decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox8)
        ),
        child: Column(
            children:
            List.generate(
                4, (index) =>
                index == 0
                    ? SizedBox()
                    : GestureDetector(
                        onTap: () async{
                          controller.setCrop(index);
                          await controller.cropsRoute();
                          },
                        child: Container(
                          width: WidgetSize(context).sizedBox181,
                          height: WidgetSize(context).sizedBox40+WidgetSize(context).sizedBox5,
                          decoration: const BoxDecoration(
                              color: Style.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Style.ultimateGrey,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(1,1)
                                )
                              ]
                          ),
                          padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox3, horizontal: WidgetSize(context).sizedBox10),
                          margin: EdgeInsets.only(bottom: WidgetSize(context).sizedBox8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.buttonName[index],
                                style: TextStyle(
                                    fontSize: WidgetSize(context).sizedBox18,
                                    color: controller.color[index],
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                              SizedBox(width: WidgetSize(context).sizedBox40,),
                              Icon(controller.icon[index], color: controller.color[index], size: WidgetSize(context).sizedBox28,)
                            ],
                          ),
                        ),
                )
            )
        ),
      );
  }
}
