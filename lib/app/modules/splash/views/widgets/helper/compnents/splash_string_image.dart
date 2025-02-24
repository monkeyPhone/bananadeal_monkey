import 'package:flutter/material.dart';

import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';
import '../../../../../../routes/const_element.dart';

class SplashStringImage extends StatelessWidget {
  const SplashStringImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Style.white,
          image: DecorationImage(
              image: AssetImage(AppElement.splashString),
              fit: BoxFit.fill
          )
      ),
      width: WidgetSize(context).sizedBox220,
      height: WidgetSize(context).sizedBox80,
    );
  }
}
