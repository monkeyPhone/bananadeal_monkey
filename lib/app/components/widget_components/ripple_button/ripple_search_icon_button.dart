import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';

import '../../../css/size.dart';
import '../../../css/style.dart';

class RippleSearchIconButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final bool? lock;
  final double? padding;
  const RippleSearchIconButton({
    required this.onTap,
    this.padding,
    this.lock,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all( padding ?? WidgetSize(context).sizedBox7_5),
      child: Material(
        borderRadius: BorderRadius.circular(999),
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: onTap,
            child: switch(lock){
              null =>
                  Icon(Icons.search, size: WidgetSize(context).sizedBox30, color: Style.yellow,),
              _ =>
                Icon(switch(lock!){
                  true => Icons.lock,
                  false => Icons.lock_open_rounded
                },

                  size: WidgetSize(context).sizedBox18, color: Style.yellow,),

            }
        ),
      ),
    );
  }
}


class RippleBackButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Color? iconColor;
  const RippleBackButton({
    required this.onTap,
    this.iconColor,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(999),
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(WidgetSize(context).sizedBox5),
            child: Icon(Icons.close, size: WidgetSize(context).sizedBox32, color: iconColor ?? Style.karajeck,),
          ),
      ),
    );
  }
}



class RippleIconButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData icon;
  final double? iconSize;
  final double? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final Color iconColor;
  const RippleIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.borderRadius,
    this.margin,
    this.iconSize,
    this.padding,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: onTap,
        inerMargin: margin,
        borderRadius: BorderRadius.circular(borderRadius ?? 999),
        height: iconSize ?? WidgetSize(context).sizedBox48,
        width: iconSize ?? WidgetSize(context).sizedBox48,
        widget: FittedBox(
          child: Padding(
            padding: EdgeInsets.all(padding ?? WidgetSize(context).sizedBox6_5),
            child: Center(child: Icon(icon, color: iconColor,)),
          ),
        )
    );
  }
}




