import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/upload/components/upload_appbar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/upload/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../css/style.dart';
import 'components/image_preview.dart';
import 'components/image_select_list.dart';
import 'components/preview_header.dart';


class Upload extends GetView<UploadController> {
  final String router;
  Upload({
    required this.router,
    Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: Column(
          children: [
            UploadAppBar(router: router),
            Obx(()=>
                Expanded(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            ImagePreview(),
                            PreviewHeader(),
                            Expanded(
                                child: SingleChildScrollView(
                                    physics: const ClampingScrollPhysics(),
                                    controller: controller.scrollController,
                                    child: ImageSelectList())

                            ),

                          ],
                        ),
                        Positioned.fill(
                            child: controller.uploaded.value == ''
                                       ? SizedBox()
                                       : Container(
                                         color: Colors.black45,
                                         child: Center(
                                           child: CircularProgressIndicator(
                                             color: Style.progressBar,
                                           ),
                                         ),
                                       )
                        )
                      ],
                    )
                )
            )
          ],
        )
    );

  }

}