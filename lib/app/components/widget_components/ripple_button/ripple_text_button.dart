import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';

import '../../../css/size.dart';
import '../../../css/style.dart';

class RippleTextButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;

  final double? rightPadding;
  final double? fontSize;
  final Color? fontColor;
  const RippleTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.rightPadding,
    this.fontSize,
    this.fontColor
  });

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: onTap,
        color: Colors.transparent,
        padding: EdgeInsets.only(
            top: WidgetSize(context).sizedBox10,
            left: WidgetSize(context).sizedBox10,
            right: rightPadding ?? WidgetSize(context).sizedBox12,
            bottom: WidgetSize(context).sizedBox10
        ),
        widget: Text(
          text, style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: fontSize ?? WidgetSize(context).sizedBox14, color: fontColor ?? Style.grey999999
        ),)
    );
  }
}
