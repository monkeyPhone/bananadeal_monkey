import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../components/image_provider/image_provider_state.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../models/src/banner/src_banner.dart';
import '../../../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../../../routes/const_element.dart';
import '../../../../../../../../../src_components/controllers/src_banner_controller.dart';
import 'banner_detail_page_view.dart';

class BannerClickPage extends GetView<SrcBannerController> {
  final SrcBannerList currentBanner;
  const BannerClickPage({

    required this.currentBanner,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleImageButton(
        image: ImageProviderState(
            imageWidth: WidgetSize(context).widthCommon,
            imageHeight: WidgetSize(context).widthCommon,
            imageUrl: ApiConsole.imageBananaUrl+currentBanner.bmPathImg,
            errUrl: AppElement.defaultNotice,  aspectRatio: AppElement.caseDialog
        ),
        onTap: (){
          currentBanner.bmCategory == 'URL'
              ? controller.launchInBrowser(currentBanner.bmUrl)
              : currentBanner.bmCategory == ''
              ? null
              : Get.to(
                  ()=> BannerDetailPageView(
                currentBanner: currentBanner,
              ),
              transition: Transition.zoom
          );
        }
    );
  }
}
