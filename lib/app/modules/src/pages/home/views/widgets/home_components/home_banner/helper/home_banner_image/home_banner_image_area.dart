import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/home/views/widgets/home_components/home_banner/helper/home_banner_image/image_route/home_banner_image_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../src_components/controllers/src_banner_controller.dart';

class HomeBannerImageArea extends StatelessWidget{
  const HomeBannerImageArea({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SrcBannerController>(
        builder: (controller){
          return HomeBannerImageRoute(
            imgList: controller.bannerList,
            carouselController: controller.bannerController,
          );
        }
    );
  }
}
