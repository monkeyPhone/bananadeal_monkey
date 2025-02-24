import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/etc_inquiry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/image_provider/image_provider_state.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../managers/image/image_dialog_manager.dart';
import '../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../routes/const_element.dart';

class InquiryImageArea extends GetView<EtcInquiryController> {
  final String imagePath;
  final bool me;
  const InquiryImageArea({
    required this.imagePath,
    required this.me,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: !me ? EdgeInsets.only(bottom: WidgetSize(context).sizedBox18) : EdgeInsets.only(right: WidgetSize(context).sizedBox18),
        decoration: BoxDecoration(
            border: Border.all(
                width: WidgetSize(context).sizedBox1, color: Style.greyCCCCCC)
        ),
        child: RippleImageButton(
          onTap: (){
            controller.imageDialogManager.openImageDownLoad(routerContext: context,
                imageUrl: imagePath, isDownload: false);
            },
          image:  !me ?
          ImageProviderState(
              imageUrl: ApiConsole.imageBananaUrl+imagePath,
              errUrl: AppElement.defaultImg,
              imageWidth: WidgetSize(context).widthCommon,
              aspectRatio: AppElement.noticeDialog
          )

              :
          ImageProviderState(
              imageWidth: WidgetSize(context).sizedBox144,
              imageUrl: ApiConsole.imageBananaUrl+imagePath,
              errUrl: AppElement.defaultImg,  aspectRatio: AppElement.noticeDialog
          ),
        )
    );
  }
}
