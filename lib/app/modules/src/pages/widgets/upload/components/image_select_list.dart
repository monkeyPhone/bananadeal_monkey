
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/upload/components/photo_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/upload/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../css/size.dart';

class ImageSelectList extends GetView<UploadController> {
  const ImageSelectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
      children: [
        GridView.builder(
          controller: controller.noController,
          physics:  NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
            mainAxisSpacing: WidgetSize(context).sizedBox1_5,
            crossAxisSpacing: WidgetSize(context).sizedBox1_5,
          ),
          itemCount: controller.imageList.length,
          itemBuilder: (BuildContext context, int index) {
            return PhotoWidget(
                key: ValueKey('${controller.imageList[index].title}_$index'),
                asset: controller.imageList[index],
                size: WidgetSize(context).sizedBox181.toInt(),
                builder: (data) {
                  return GestureDetector(
                      onTap: () async {
                        await controller.selectedBox(index);
                      },
                      child: GetBuilder<UploadController>(
                        builder: (udC) {
                          return Opacity(
                            opacity: udC.imageList[index] ==
                                udC.selectedImage.value
                                ? 0.3
                                : 1,
                            child: Image.memory(
                              data,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      )
                  );
                }
            );
          },
        ),
        controller.getLoading.value
        ?
        Positioned.fill(
            child: Container(
              color: Colors.black45,
            )
        )
            :
            const SizedBox()
      ],
    ));
  }
}

