import 'dart:io';

import 'package:flutter/material.dart' hide CarouselController;
import '../../../../../../../../../../../components/carousel/src/helpers/carousel_controller.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../models/src/banner/src_banner.dart';
import '../../../../../../../../../../../routes/const_element.dart';
import 'banner_carousel.dart';

class HomeBannerImageRoute extends StatelessWidget {
  final List<SrcBannerList> imgList;
  final CarouselController carouselController;
  const HomeBannerImageRoute({
    required this.imgList,
    required this.carouselController,
    super.key});

  @override
  Widget build(BuildContext context) {
    return imgList.isNotEmpty
             ?  _LayoutBox(
                    imgList: imgList,
                    carouselController: carouselController,
                  )
             :  Image.asset(
                  AppElement.defaultNotice,
                  height: (WidgetSize(context).widthCommon*9)/16,
                  width: WidgetSize(context).widthCommon,
                  fit: BoxFit.fill,
                );
  }
}

class _LayoutBox extends StatelessWidget {
  final List<SrcBannerList> imgList;
  final CarouselController carouselController;
  const _LayoutBox({
    required this.imgList,
    required this.carouselController,
  });

  @override
  Widget build(BuildContext context) {
    return BannerCarousel(imgList: imgList, carouselController: carouselController,);
  }
}

