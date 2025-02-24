import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:flutter/material.dart';
import '../../../css/style.dart';

class RippleDecorationButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final Color? color;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final BoxBorder? outBorder;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? inerMargin;
  final EdgeInsetsGeometry? padding;
  final Key? unique;
  final Widget widget;
  final double? height;
  final double? width;
  const RippleDecorationButton({
    super.key,
    required this.onTap,
    this.color,
    this.onLongPress,
    this.borderRadius,
    this.boxShadow,
    this.border,
    this.outBorder,
    this.margin,
    this.inerMargin,
    this.padding,
    this.unique,
    this.height,
    this.width,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? Style.white,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        border: outBorder
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onLongPress: onLongPress,
          onTap: AppOutsFunction().debounce(callback: onTap!),
          child: Container(
              key: unique,
              padding: padding,
              margin: inerMargin,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: border,
                  borderRadius: borderRadius
              ),
              width: width,
              height: height,
              child: widget
          ),
        ),
      ),
    );
  }
}

class RippleDecorationButtonColors extends StatelessWidget {
  final GestureTapCallback onTap;
  final GestureLongPressCallback? onLongPress;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget widget;
  final double? height;
  final double? width;
  const RippleDecorationButtonColors({
    super.key,
    required this.onTap,
    this.onLongPress,
    this.borderRadius,
    this.border,
    this.color,
    this.margin,
    this.padding,
    required this.widget,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? Style.yellow,
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Style.yellowCheck.withOpacity(0.5),
          splashColor: Style.yellowCheck,
          borderRadius: borderRadius,
          onLongPress: onLongPress,
          onTap: onTap,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: border,
                  borderRadius: borderRadius
              ),
              padding: padding,
              width: width,
              height: height,
              child: widget),
        ),
      ),
    );
  }
}


class RippleImageButton extends StatelessWidget {
  final Widget image;
  final GestureTapCallback onTap;
  final BorderRadius? borderRadius;
  const RippleImageButton({
    super.key,
    required this.image,
    required this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image,
        Positioned.fill(
            child: Material(
              borderRadius: borderRadius,
              color: Colors.transparent,
              child:  InkWell(
                highlightColor: Colors.grey.shade200.withValues(alpha: 0.3),
                splashColor: Colors.grey.shade200.withValues(alpha: 0.3),
                borderRadius: borderRadius,
                onTap: onTap,
              ),
            )
        )
      ],
    );
  }
}

class RippleImageButtonColors extends StatelessWidget {
  final Widget image;
  final GestureTapCallback onTap;
  final BorderRadius? borderRadius;
  const RippleImageButtonColors({
    super.key,
    required this.image,
    required this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image,
        Positioned.fill(
            child: Material(
              borderRadius: borderRadius,
              color: Colors.transparent,
              child:  InkWell(
                highlightColor: Style.yellowCheck.withOpacity(0.3),
                splashColor: Style.yellow.withOpacity(0.3),
                borderRadius: borderRadius,
                onTap: onTap,
              ),
            )
        )
      ],
    );
  }
}




