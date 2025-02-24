import 'package:flutter/material.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';

class ExplainMenuText extends StatelessWidget {
  final String text;
  const ExplainMenuText({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: Style.specBlue,
          fontWeight: FontWeight.w700,
          fontSize: WidgetSize(context).sizedBox16
      ),
    );
  }
}

class ExplainSubText extends StatelessWidget {
  final String text;
  const ExplainSubText({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: Style.blackWrite,
          fontWeight: FontWeight.w400,
          fontSize: WidgetSize(context).sizedBox16
      ),
    );;
  }
}

