import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../../css/style.dart';

class ProfileTimeText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? fontColor;
  const ProfileTimeText({
    required this.text,
    this.fontWeight,
    this.fontColor,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox12,
          fontWeight: fontWeight ?? FontWeight.w700,
          color: fontColor ?? Style.brown
      ),
    );
  }
}
