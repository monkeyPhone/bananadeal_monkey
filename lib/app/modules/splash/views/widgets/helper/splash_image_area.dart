import 'package:banana_deal_by_monkeycompany/app/modules/splash/views/widgets/helper/compnents/splash_animated_character.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/splash/views/widgets/helper/compnents/splash_progress_bar.dart';
import 'package:flutter/material.dart';
import '../../../../../css/size.dart';
import 'compnents/splash_string_image.dart';

class SplashImageArea extends StatelessWidget {
  const SplashImageArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              SplashAnimatedCharacter(),
              Positioned(
                bottom: -WidgetSize(context).sizedBox10,
                child: SplashStringImage()

              )
            ],
          ),

          SizedBox(
            height: WidgetSize(context).splashPad,
          ),
          SplashProgressBar()
        ],
      ),
    );
  }
}
