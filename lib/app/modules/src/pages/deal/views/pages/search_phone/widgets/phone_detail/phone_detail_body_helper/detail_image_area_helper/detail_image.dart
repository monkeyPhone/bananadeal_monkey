import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../components/image_provider/image_provider_state.dart';
import '../../../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../routes/const_element.dart';

class DetailImage extends GetView<SearchPhoneDetailController> {
  final String imageUrl;
  const DetailImage({
    required this.imageUrl,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Style.white,
        padding: EdgeInsets.only(
            top: WidgetSize(context).sizedBox5,
            bottom: WidgetSize(context).sizedBox20),
        child: RippleImageButton(
            image: ImageProviders(
                imageWidth: WidgetSize(context).widthCommon,
                imageHeight: WidgetSize(context).width06,
                imageUrl: imageUrl,
                errUrl: AppElement.defaultPhone,
                imageLabel: AppElement.caseHeight
            ),
            onTap: (){
              controller.openDialog(
                  ImageProviderState(
                      imageWidth: WidgetSize(context).widthCommon,
                      imageHeight: WidgetSize(context).heightCommon-((MediaQuery.of(context).padding.bottom+MediaQuery.of(context).padding.top)),
                      imageUrl: imageUrl,
                      errUrl: AppElement.defaultPhone,
                      aspectRatio: AppElement.caseDialog
                  )
              );
            }
        )
    );
  }
}
