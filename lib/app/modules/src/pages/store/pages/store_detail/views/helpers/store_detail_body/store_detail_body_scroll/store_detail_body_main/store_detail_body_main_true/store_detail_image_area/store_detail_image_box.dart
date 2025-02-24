import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/image/image_dialog_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../../components/carousel/src/_flutter_carousel_widget.dart';
import '../../../../../../../../../../../../../components/carousel/src/enums/center_page_enlarge_strategy.dart';
import '../../../../../../../../../../../../../components/carousel/src/helpers/carousel_options.dart';
import '../../../../../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../../../../../routes/const_element.dart';


class StoreDetailImageBox extends GetView<StoreDetailController> {
  final List storePreview;

  const StoreDetailImageBox({
    required this.storePreview,
    super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel.builder(
        itemCount: storePreview.length,
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: storePreview.length != 1,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          controller: controller.cController,
          pageSnapping: true,
          scrollDirection: Axis.horizontal,
          pauseAutoPlayOnTouch: true,
          pauseAutoPlayOnManualNavigate: true,
          pauseAutoPlayInFiniteScroll: false,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          disableCenter: true,
          showIndicator: false,
            onPageChanged: (index, reason) {
              controller.pageCanged(index);
            }
        ),
        itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
        RippleImageButton(
            image: ClipRRect(
                child: Stack(
                  children: <Widget>[
                    ImageProviders(
                        imageWidth: WidgetSize(context).widthCommon,
                        imageHeight: WidgetSize(context).widthCommon9_16,
                        imageUrl: ApiConsole.imageBananaUrl+storePreview[index],
                        errUrl: AppElement.defaultImg,
                        imageLabel: AppElement.caseOther
                    )
                  ],
                )
            ),
          onTap: (){
            ImageDialogManager().openImageDownLoad(routerContext: context, imageUrl: storePreview[index], isDownload: false);
          },
        )
    );
  }
}
