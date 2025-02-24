import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/out_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/app/components/text_class/text_class.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_1_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/carousel/src/_flutter_carousel_widget.dart';
import '../../../../../../../../../components/carousel/src/enums/center_page_enlarge_strategy.dart';
import '../../../../../../../../../components/carousel/src/helpers/carousel_options.dart';
import '../../../../../../../../../components/image_provider/image_provider_state.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../routes/const_element.dart';


class Sign1ImageArea extends GetView<SignView1Controller> {
  const Sign1ImageArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: WidgetSize(context).sizedBox16),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  width: WidgetSize(context).sizedBox2, color: Style.karajeck),
              bottom: BorderSide(
                  width: WidgetSize(context).sizedBox2, color: Style.karajeck)
          )
      ),
      child: Column(
        children: [
          Expanded(
            child: FlutterCarousel.builder(
                itemCount: controller.images.length,
                options: CarouselOptions(
                    height: WidgetSize(context).heightCommon,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    controller: controller.emptyController,
                    pageSnapping: true,
                    scrollDirection: Axis.horizontal,
                    pauseAutoPlayOnTouch: true,
                    pauseAutoPlayOnManualNavigate: true,
                    pauseAutoPlayInFiniteScroll: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    disableCenter: true,
                    showIndicator: false,
                    onPageChanged: (index, reason) {
                      controller.pageChanged(index);
                    }
                ),
                itemBuilder: (BuildContext context, int index, int pageViewIndex) =>

                    Padding(
                      padding: EdgeInsets.only(top: WidgetSize(context).sizedBox22),
                      child: SizedBox.expand(
                        child: ClipRRect(
                            child: OutImageBinder(
                                imageWidth: WidgetSize(context).widthCommon,
                                imageHeight: WidgetSize(context).heightCommon,
                                imageUrl: ApiConsole.imageBananaUrl +
                                    controller.images[index].aiiPathImg,
                                errUrl: AppElement.defaultImg,
                              imageLabel: 'carousel',
                            )
                        ),
                      ),
                    )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: WidgetSize(context).sizedBox8),
            child: Obx(() =>
            controller.images.length > 15
                ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text16PxBlackW400(text: '${controller
                        .currentImageIndex.value + 1}'),
                    Text16PxBlackW400(text: '  /  '),
                    Text16PxBlackW400(text: '${controller.images
                        .length}'),
                  ],
                ),
                SizedBox(height: WidgetSize(context).sizedBox8,)
              ],
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.images
                  .asMap()
                  .entries
                  .map((entry) {
                return GestureDetector(
                  onTap: () =>
                      controller.carouselController.animateToPage(
                          entry.key),
                  child: Container(
                    width: WidgetSize(context).sizedBox15,
                    height: WidgetSize(context).sizedBox15,
                    margin: EdgeInsets.all(WidgetSize(context).sizedBox8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(
                            controller.currentImageIndex.value ==
                                entry.key ? 0.9 : 0.2)),
                  ),
                );
              }).toList(),
            ),
            ),
          )
        ],
      ),
    );
  }
}
