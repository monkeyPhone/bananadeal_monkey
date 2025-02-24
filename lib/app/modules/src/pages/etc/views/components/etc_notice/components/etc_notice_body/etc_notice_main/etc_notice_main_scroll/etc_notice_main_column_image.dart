import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_notice/etc_notice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../components/image_provider/image_provider_state.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../managers/image/image_dialog_manager.dart';
import '../../../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../../../routes/const_element.dart';

class EtcNoticeMainColumnImage extends GetView<EtcNoticeController> {
  final String imagePath;
  const EtcNoticeMainColumnImage({
    required this.imagePath,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.imageDialogManager.openImageDownLoad(
            routerContext: context,
            imageUrl: imagePath, isDownload: false);
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: WidgetSize(context).sizedBox1, color: Style.greyCCCCCC)
          ),
          child: ImageProviderState(
              imageWidth: WidgetSize(context).widthCommon,
              imageUrl: ApiConsole.imageBananaUrl+imagePath,
              errUrl: AppElement.defaultThumb,  aspectRatio: AppElement.caseNotice
          )
      ),
    );
  }
}
