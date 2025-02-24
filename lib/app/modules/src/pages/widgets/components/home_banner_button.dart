import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/chat_service_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../css/size.dart';
import '../../../../../routes/const_element.dart';

class HomeBannerButton extends StatelessWidget {
  const HomeBannerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return
    //   FittedBox(
    //   fit: BoxFit.fill,
    //   child:  RippleImageButton(
    //     image: Padding(
    //       padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
    //       child: AssetImageBox(
    //           imageHeight: WidgetSize(context).height60px,
    //           imageWidth: WidgetSize(context).height60px*2,
    //           imageUrl: AppElement.bananaLogoOri),
    //     ),
    //     // SvgPicture.asset(
    //     //           AppElement.bananaLogoSvg,
    //     //         width:  WidgetSize(context).sizedBox100,
    //     //         height: WidgetSize(context).sizedBox50,
    //     //       ),
    //     onTap: () {
    //       Get.offAllNamed(Routes.BANNERPAGE);
    //     },
    //   ),
    // );


      RippleDecorationButton(
        padding: EdgeInsets.only(
          left: WidgetSize(context).sizedBox16
        ),
        onTap: () {
           Get.offAllNamed(Routes.BANNERPAGE);
        },
        borderRadius: BorderRadius.circular(999),
        widget: AssetImageBox(
          imageHeight: WidgetSize(context).sizedBox34, imageWidth: (746/250)*WidgetSize(context).sizedBox34, imageUrl: AppElement.bananaLogoOri, boxFit: BoxFit.fill,)
    );
  }
}
