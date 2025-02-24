import 'package:banana_deal_by_monkeycompany/package/data/home_banner_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/banner/view/widgets/image/banner_image_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/banner/view/widgets/notice/banner_notice_view.dart';
import 'package:flutter/material.dart';

class BannerView extends StatelessWidget {
  final HomeBannerVO bannerVO;
  const BannerView({super.key,
    required this.bannerVO
  });

  @override
  Widget build(BuildContext context) {
    return switch(bannerVO.bmCategory){
      '이미지' => BannerImageView(imageUrl: bannerVO.bmImgPathImg,),
      _ => BannerNoticeView(bannerVO: bannerVO,)
    };
  }
}


