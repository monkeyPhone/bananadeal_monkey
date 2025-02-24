import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../../css/size.dart';

class ProfileTimerPad extends StatelessWidget {
  final double? pad;
  const ProfileTimerPad({
    this.pad,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: pad ?? WidgetSize(context).sizedBox5,);
  }
}
