import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import '../css/size.dart';
import '../css/style.dart';

class SubButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;
  final Color? backGroundColor;
  final double? width;
  final double? height;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  const SubButton({
    required this.onTap,
    required this.text,
    this.backGroundColor,
    this.width,
    this.height,
    this.textSize,
    this.textColor,
    this.fontWeight,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        color: backGroundColor,
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        width: width ?? WidgetSize(context).widthCommon,
        height: height ?? WidgetSize(context).height60px,
        widget: Center(
            child: Text(
              text, style:
            TextStyle(fontSize: textSize ?? WidgetSize(context).sizedBox18, color: textColor ?? Style.blackWrite, fontWeight: fontWeight ?? FontWeight.w400),
            )
        )
    );
  }
}
