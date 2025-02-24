import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/neumorphic/src/neumorphic_box_shape.dart';
import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/neumorphic/src/theme/theme.dart';
import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/neumorphic/src/widget/button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:flutter/material.dart';

class NeoButtonFree extends StatelessWidget {
  final WidgetSize size;
  final VoidCallback onPressed;
  final EdgeInsets? margin;
  final double? width;
  final double? radius;
  final double? fontSize;
  final double? height;
  final double? depth;
  final double? intensity;
  final double? surfaceIntensity;
  final Color? shadowColor;
  final Widget child;
  const NeoButtonFree({
    super.key,
    required this.size,
    required this.onPressed,
    this.width,
    this.margin,
    this.height,
    this.radius,
    this.fontSize,
    this.depth,
    this.intensity,
    this.surfaceIntensity,
    this.shadowColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? size.sizedButton,
        width: width ?? size.widthCommon,
        child: NeumorphicButton(
          margin: margin,
          onPressed:  AppOutsFunction().debounce(callback: onPressed),
          style: NeumorphicStyle(
            // depth: Get.width*0.01,
            // surfaceIntensity: 0,
            // intensity: 0.75,
            shadowDarkColor: Style.yellow.withValues(alpha: 0.8) ,
            depth: depth ?? size.etc01,//Get.width*0.0187,
            intensity: intensity ?? 0.6,//0.86,
            surfaceIntensity: surfaceIntensity ?? 0,//0.5,
            shape: NeumorphicShape.flat,
            color: Style.yellow,
            boxShape:
            NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? size.widthCommon)),
          ),
          child: child,
        )
    );
  }
}