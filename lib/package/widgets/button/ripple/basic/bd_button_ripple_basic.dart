import 'package:banana_deal_by_monkeycompany/package/common/bd_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdButtonRippleBasic extends StatelessWidget {
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
  const BdButtonRippleBasic({
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
          color: color ?? Theme.of(context).colorScheme.surface,
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
          onTap: isDebounce == null ? context.read<BdCommon>().func.debounce(callback: onTap) : onTap,
          child: Container(
              padding: padding,
              margin: inerMargin,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceDim,
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