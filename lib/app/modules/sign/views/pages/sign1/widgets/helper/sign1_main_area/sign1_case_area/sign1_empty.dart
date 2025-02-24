import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_1_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/carousel/src/_flutter_carousel_widget.dart';
import '../../../../../../../../../components/carousel/src/enums/center_page_enlarge_strategy.dart';
import '../../../../../../../../../components/carousel/src/helpers/carousel_options.dart';
import '../../../../../../../../../css/size.dart';




class Sign1Empty extends GetView<SignView1Controller> {
  const Sign1Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FlutterCarousel.builder(
              itemCount: controller.defaultImages.length,
              options: CarouselOptions(
                  height: WidgetSize(context).heightCommon,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
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
                padding: EdgeInsets.only(top: WidgetSize(context).sizedBox22,),
                child: SizedBox.expand(
                  child: ClipRRect(
                      child: Image.asset(controller.defaultImages[index], fit: BoxFit.fill,)
                  ),
                ),
              )
          ),
        ),
        Obx(
                (){
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.defaultImages.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => controller.emptyController.animateToPage(entry.key),
                      child: Container(
                        width: WidgetSize(context).sizedBox15,
                        height: WidgetSize(context).sizedBox15,
                        margin: EdgeInsets.all(WidgetSize(context).sizedBox8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(
                                controller.currentImageIndex.value == entry.key
                                    ? 0.9
                                    : 0.2
                            )
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            }
        ),
      ],
    );
  }
}

