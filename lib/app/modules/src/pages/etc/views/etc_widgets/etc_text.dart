import 'package:flutter/material.dart';

import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';

class EtcPauseText1 extends StatelessWidget {
  final String text;
  const EtcPauseText1({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox16, color: Style.blackWrite),);
  }
}

class EtcPauseText2 extends StatelessWidget {
  final String text;
  final Color? color;
  const EtcPauseText2({
    required this.text,
    this.color,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontWeight: FontWeight.w400, fontSize: WidgetSize(context).sizedBox16, color: color ?? Style.blackWrite),);
  }
}

