import 'package:banana_deal_by_monkeycompany/app/modules/splash/views/widgets/helper/splash_image_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/splash/views/widgets/helper/splash_text_area.dart';
import 'package:flutter/material.dart';
import '../../../css/app_basic_component/bagic_canvas.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: false,
        onPopInvoked: (bool didPop, Object? result) {
          if(didPop){
            return;
          }
        },
        body: SplashImageArea(),
        bottomNavigationBar: SplashTextArea()
    );
  }

}
