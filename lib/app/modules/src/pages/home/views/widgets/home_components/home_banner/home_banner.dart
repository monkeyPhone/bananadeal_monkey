import 'dart:io';

import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/home/views/widgets/home_components/home_banner/helper/home_banner_image/home_banner_image_area.dart';
import 'package:flutter/material.dart';
import 'helper/home_banner_stack/home_banner_stack_area.dart';


class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        HomeBannerImageArea(),
        HomeBannerStackArea()
      ],
    );
  }
}



