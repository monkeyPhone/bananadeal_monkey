import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:flutter/material.dart';


class BdRippleButtonBasic extends StatelessWidget {
  final bool? isDebounce;
  final GestureTapCallback onTap;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final Color? color;
  final Color? splashColor;
  final Color? highlightColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final BoxBorder? outBorder;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? inerMargin;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final double? height;
  final double? width;
  const BdRippleButtonBasic({
    super.key,
    this.isDebounce,
    required this.onTap,
    this.onDoubleTap,
    this.color,
    this.splashColor,
    this.highlightColor,
    this.onLongPress,
    this.borderRadius,
    this.boxShadow,
    this.border,
    this.outBorder,
    this.margin,
    this.inerMargin,
    this.padding,
    this.height,
    this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: color ?? white,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          border: outBorder
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: splashColor,
          highlightColor: highlightColor,
          borderRadius: borderRadius,
          onLongPress: onLongPress,
          onDoubleTap: onDoubleTap,
          onTap: isDebounce == null ? commonFunction.debounce(callback: onTap) : onTap,
          child: Container(
              padding: padding,
              margin: inerMargin,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: border,
                  borderRadius: borderRadius
              ),
              width: width,
              height: height,
              child: child
          ),
        ),
      ),
    );
  }
}