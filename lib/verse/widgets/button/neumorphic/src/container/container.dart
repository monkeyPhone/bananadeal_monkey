import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import '../decoration/neumorphic_decorations.dart';
import '../neumorphic_box_shape.dart';
import '../theme/neumorphic_theme.dart';
import '../widget/clipper/neumorphic_box_shape_clipper.dart';


@immutable
class Neumorphic extends StatelessWidget {
  static const DEFAULT_DURATION = const Duration(milliseconds: 100);
  static const DEFAULT_CURVE = Curves.linear;

  static const double MIN_DEPTH = -20.0;
  static const double MAX_DEPTH = 20.0;

  static const double MIN_INTENSITY = 0.0;
  static const double MAX_INTENSITY = 1.0;

  static const double MIN_CURVE = 0.0;
  static const double MAX_CURVE = 1.0;

  final Widget? child;

  final NeumorphicStyle? style;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Curve curve;
  final Duration duration;
  final bool
  drawSurfaceAboveChild; //if true => boxDecoration & foreground decoration, else => boxDecoration does all the work

  Neumorphic({
    Key? key,
    this.child,
    this.duration = Neumorphic.DEFAULT_DURATION,
    this.curve = Neumorphic.DEFAULT_CURVE,
    this.style,
    this.textStyle,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.drawSurfaceAboveChild = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = NeumorphicTheme.currentTheme(context);
    final NeumorphicStyle style = (this.style ?? NeumorphicStyle())
        .copyWithThemeIfNull(theme)
        .applyDisableDepth();

    return _NeumorphicContainer(
      padding: this.padding,
      textStyle: this.textStyle,
      drawSurfaceAboveChild: this.drawSurfaceAboveChild,
      duration: this.duration,
      style: style,
      curve: this.curve,
      margin: this.margin,
      child: this.child,
    );
  }
}

class _NeumorphicContainer extends StatelessWidget {
  final NeumorphicStyle style;
  final TextStyle? textStyle;
  final Widget? child;
  final EdgeInsets margin;
  final Duration duration;
  final Curve curve;
  final bool drawSurfaceAboveChild;
  final EdgeInsets padding;

  _NeumorphicContainer({
    Key? key,
    this.child,
    this.textStyle,
    required this.padding,
    required this.margin,
    required this.duration,
    required this.curve,
    required this.style,
    required this.drawSurfaceAboveChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = this.style.boxShape ?? NeumorphicBoxShape.rect();

    return DefaultTextStyle(
      style: this.textStyle ?? material.Theme.of(context).textTheme.bodyMedium!,
      child: AnimatedContainer(
        margin: this.margin,
        duration: this.duration,
        curve: this.curve,
        child: NeumorphicBoxShapeClipper(
          shape: shape,
          child: Padding(
            padding: this.padding,
            child: this.child,
          ),
        ),
        foregroundDecoration: NeumorphicDecoration(
          isForeground: true,
          renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
          splitBackgroundForeground: this.drawSurfaceAboveChild,
          style: this.style,
          shape: shape,
        ),
        decoration: NeumorphicDecoration(
          isForeground: false,
          renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
          splitBackgroundForeground: this.drawSurfaceAboveChild,
          style: this.style,
          shape: shape,
        ),
      ),
    );
  }
}