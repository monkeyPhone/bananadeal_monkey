import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../../css/size.dart';


class StoreDetailHomeIntroText extends StatelessWidget {
  final String homeIntro;
  const StoreDetailHomeIntroText({
    required this.homeIntro,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
          homeIntro == ''
              ? ''
              : homeIntro,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: WidgetSize(context).sizedBox16)
    );
  }
}
