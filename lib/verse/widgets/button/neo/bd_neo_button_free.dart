import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neumorphic/flutter_neumorphic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdNeoButtonFree extends StatelessWidget {
  final CommonSize size;
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
  const BdNeoButtonFree({
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
        onPressed:  context.read<VerseConfig>().function.debounce(callback: onPressed),
        style: NeumorphicStyle(
          // depth: Get.width*0.01,
          // surfaceIntensity: 0,
          // intensity: 0.75,
          shadowDarkColor: yellow.withOpacity(0.8) ,
          depth: depth ?? size.etc01,//Get.width*0.0187,
          intensity: intensity ?? 0.6,//0.86,
          surfaceIntensity: surfaceIntensity ?? 0,//0.5,
          shape: NeumorphicShape.flat,
          color: yellow,
          boxShape:
          NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? size.widthCommon)),
        ),
        child: child,
        )
    );
  }
}