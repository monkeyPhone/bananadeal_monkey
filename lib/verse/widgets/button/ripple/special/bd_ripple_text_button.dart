import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:flutter/material.dart';

class BdRippleTextButton extends StatelessWidget {
  final CommonSize size;
  final GestureTapCallback onTap;
  final String text;
  final double? rightPadding;
  final double? fontSize;
  final Color? fontColor;
  const BdRippleTextButton({
    super.key,
    required this.size,
    required this.onTap,
    required this.text,
    this.rightPadding,
    this.fontSize,
    this.fontColor
  });

  @override
  Widget build(BuildContext context) {
    return BdRippleButtonBasic(
        onTap: onTap,
        color: Colors.transparent,
        padding: EdgeInsets.only(
            top: size.sizedBox10,
            left: size.sizedBox10,
            right: rightPadding ?? size.sizedBox12,
            bottom: size.sizedBox10
        ),
        child: Text(
          text, style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: fontSize ?? size.sizedBox14, color: fontColor ?? grey999999
        ),)
    );
  }
}
