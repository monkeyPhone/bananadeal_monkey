import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../../../managers/image/image_dialog_manager.dart';
import '../../../../../../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../../../../../../routes/const_element.dart';

class ReviewImageArea extends GetView<StoreDetailController> {
  final String imagePath;
  const ReviewImageArea({
    required this.imagePath,
    super.key});

  @override
  Widget build(BuildContext context) {
    return imagePath == ''
        ?
    SizedBox() :
    GestureDetector(
      onTap: (){
        ImageDialogManager().openImageDownLoad(routerContext: context, imageUrl: imagePath, isDownload: false);
      },
      child: Container(
          margin: EdgeInsets.only(right: WidgetSize(context).sizedBox10),
          decoration: BoxDecoration(
              border: Border.all(color: Style.greyD9D9D9, width: WidgetSize(context).sizedBox1)
          ),
          child: ImageProviders(
              imageWidth: WidgetSize(context).sizedBox96*1.618,
              imageHeight: WidgetSize(context).sizedBox96,
              imageUrl: ApiConsole.imageBananaUrl+imagePath,
              errUrl: AppElement.defaultImg,
              imageLabel: AppElement.caseReview
          )
      ),
    )
    ;;
  }
}
