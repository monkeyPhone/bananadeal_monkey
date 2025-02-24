import 'package:banana_deal_by_monkeycompany/app/modules/splash/controllers/splash_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/home/views/widgets/home_components/home_deal/helpers/nb1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';
import '../../gradient_circular_progress_indicator.dart';

class SplashProgressBar extends GetView<SplashController> {
  const SplashProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (str) =>
        str.versionNew.value.status >= 500
            ? _RestartButton()
            : _ProgressBar()
    );
  }
}


class _ProgressBar extends GetView<SplashController> {
  const _ProgressBar();

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(controller.animationController),
      child: GradientCircularProgressIndicator(radius: WidgetSize(context).sizedBox40, gradientColors: [Style.greyLine, Style.greyLine.withOpacity(0.2), ],),
    );
  }
}


class _RestartButton extends GetView<SplashController> {
  const _RestartButton();

  @override
  Widget build(BuildContext context) {
    return NbReButton(
      onPressed: () async{
        await controller.onInitFunction();
      },
    );
  }
}
