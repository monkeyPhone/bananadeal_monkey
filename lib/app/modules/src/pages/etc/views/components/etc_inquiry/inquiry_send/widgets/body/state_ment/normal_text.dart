import 'package:flutter/material.dart';

import '../../../../../../../../../../../css/size.dart';

class NormalText extends StatelessWidget {
  final String text;
  const NormalText({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: WidgetSize(context).sizedBox4
      ),
      child: Text(text, style: TextStyle(fontSize: WidgetSize(context).sizedBox19, fontWeight: FontWeight.w700),),
    );
  }
}
