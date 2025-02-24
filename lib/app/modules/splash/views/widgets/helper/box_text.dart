import 'package:flutter/material.dart';

import '../../../../../css/size.dart';
import '../../../../../css/style.dart';

class BoxText extends StatelessWidget {
  String text;
   BoxText({
     required this.text,
     super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: WidgetSize(context).sizedBox12,
          color: Style.greyWrite
      ),
    );
  }
}
