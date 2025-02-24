import 'dart:io';

import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/bottom_nav_bar/controllers/bd_bot_nav_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_banner_controller.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:get/get.dart';
import '../../../../../../../../../../../components/carousel/src/_flutter_carousel_widget.dart';
import '../../../../../../../../../../../components/carousel/src/enums/center_page_enlarge_strategy.dart';
import '../../../../../../../../../../../components/carousel/src/helpers/carousel_controller.dart';
import '../../../../../../../../../../../components/carousel/src/helpers/carousel_options.dart';
import '../../../../../../../../../../../models/src/banner/src_banner.dart';
import '../click_banner/banner_click_page.dart';


class BannerCarousel extends GetView<BdBotNavController> {
  final List<SrcBannerList> imgList;
  final CarouselController carouselController;
  const BannerCarousel({
    required this.imgList,
    required this.carouselController,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (page) => FlutterCarousel.builder(
                itemCount: imgList.length,
                options: CarouselOptions(
                    aspectRatio: 8/5,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: imgList.length != 1,
                    reverse: false,
                    autoPlay:
                      imgList.length == 1
                      ? false
                      : page.value == 0,
                    autoPlayInterval: const Duration(seconds: 7),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    controller: carouselController,
                    pageSnapping: true,
                    scrollDirection: Axis.horizontal,
                    pauseAutoPlayOnTouch: true,
                    pauseAutoPlayOnManualNavigate: true,
                    pauseAutoPlayInFiniteScroll: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    disableCenter: true,
                    showIndicator: false,
                    onPageChanged: (index, reason) {
                      SrcBannerController.to.carouselPageChanged(index);
                    }
                ),
                itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                    BannerClickPage(
                      currentBanner: imgList[index],
                    )
            )
        , controller.pageIndex);
  }
}
