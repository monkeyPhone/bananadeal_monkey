import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:flutter/material.dart';

class BdRippleIconsButton extends StatelessWidget {
  final CommonSize size;
  final GestureTapCallback onTap;
  final IconData icon;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final Color? iconColor;
  final Color? backColor;
  const BdRippleIconsButton({
    super.key,
    required this.size,
    required this.onTap,
    required this.icon,
    this.borderRadius,
    this.margin,
    this.iconSize,
    this.padding,
    this.iconColor,
    this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return BdRippleButtonBasic(
        color: backColor,
        onTap: onTap,
        inerMargin: margin,
        borderRadius: BorderRadius.circular(borderRadius ?? 999),
        height: iconSize ?? size.sizedBox45,
        width: iconSize ?? size.sizedBox45,
        child: FittedBox(
          child: Padding(
            padding: padding ?? EdgeInsets.all(size.sizedBox5),
            child: Icon(icon, color: iconColor ?? bananaBack,),
          ),
        )
    );
  }
}