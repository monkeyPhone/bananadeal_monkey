import 'package:banana_deal_by_monkeycompany/app/components/image_provider/image_provider_state.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/etc_some_inquiry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../managers/image/image_dialog_manager.dart';
import '../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../routes/const_element.dart';

class SomeInquiryCorrectColumnImage extends GetView<EtcSomeInquiryController> {
  final String imagePath;
  const SomeInquiryCorrectColumnImage({
    required this.imagePath,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        ImageDialogManager().openImageDownLoad(routerContext: context, imageUrl: imagePath, isDownload: false);
      },
      child: Container(
          margin: EdgeInsets.only(bottom: WidgetSize(context).sizedBox16),
          decoration: BoxDecoration(
              border: Border.all(
                  width: WidgetSize(context).sizedBox1, color: Style.greyCCCCCC)
          ),
          child: ImageProviderState(
              imageUrl: ApiConsole.imageBananaUrl+imagePath,
              errUrl: AppElement.defaultThumb,
              imageWidth: WidgetSize(context).widthCommon,
              aspectRatio: AppElement.caseNotice
          ),

      ),
    );
  }
}
