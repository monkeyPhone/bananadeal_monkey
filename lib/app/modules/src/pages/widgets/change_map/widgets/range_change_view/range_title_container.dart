import 'package:flutter/material.dart';

import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';

class RangeTitleContainer extends StatelessWidget {
  final String text;
  const RangeTitleContainer({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16, vertical: WidgetSize(context).sizedBox9),
      width: WidgetSize(context).widthCommon,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyButtonDisable),
              bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyButtonDisable)
          ),
          color: Style.greyF4F4F4
      ),
      child: Text(text,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: WidgetSize(context).sizedBox20
        ),
      ),
    );
  }
}
