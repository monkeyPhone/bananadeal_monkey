import 'package:flutter/material.dart';
import '../../../../../../css/size.dart';
import '../../../../../../routes/const_element.dart';
import '../../animated/translation_animated_widget.dart';

class SplashAnimatedCharacter extends StatelessWidget {
  const SplashAnimatedCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return TranslationAnimatedWidget(
      duration: Duration(seconds: 2),
      values: [
        Offset(0, 200), // disabled value value
        Offset(0, 250), //intermediate value
        Offset(0, 0) //enabled value
      ],
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppElement.splashCharacter),
                fit: BoxFit.fill
            )
        ),
        width: WidgetSize(context).sizedBox220,
        height: WidgetSize(context).sizedBox220,
      ),
    );
  }
}
