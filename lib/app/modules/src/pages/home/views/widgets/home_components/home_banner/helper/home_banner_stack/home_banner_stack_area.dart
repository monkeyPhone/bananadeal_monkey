import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../src_components/controllers/src_banner_controller.dart';

class HomeBannerStackArea extends StatelessWidget {
  const HomeBannerStackArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: WidgetSize(context).sizedBox5,
      right: WidgetSize(context).sizedBox5,
      child: GetBuilder<SrcBannerController>(
          builder: (srcC){
            return
              srcC.bannerList.isEmpty || srcC.bannerList.length == 1
                  ? const SizedBox()
                  : Container(
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(WidgetSize(context).width01)
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: WidgetSize(context).sizedBox7_5, horizontal: WidgetSize(context).sizedBox9_5),
                  child:  Text(
                    '${srcC.carouselPage.value+1} / ${srcC.bannerList.length}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: WidgetSize(context).sizedBox10,
                      fontWeight: FontWeight.w400,
                    ),
                   )
                  );
          }
      ),
    );
  }
}
