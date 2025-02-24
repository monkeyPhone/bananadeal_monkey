import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neumorphic/flutter_neumorphic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdNeoButtonCustom extends StatelessWidget {
  final CommonSize size;
  final VoidCallback onPressed;
  final bool? isDebounce;
  final Color? boxColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? child;
  final double? width;
  final double? radius;
  final double? height;
  final double? depth;
  final double? intensity;
  final double? surfaceIntensity;
  final Color? shadowColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  const BdNeoButtonCustom({
    super.key,
    required this.size,
    this.isDebounce,
    required this.onPressed,
    this.boxColor,
    this.textColor,
    this.borderColor,
    this.child,
    this.width,
    this.height,
    this.radius,
    this.depth,
    this.intensity,
    this.surfaceIntensity,
    this.shadowColor,
    this.padding,
    this.margin
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        padding: padding ?? EdgeInsets.all(size.sized8grid),
        margin: margin,
        onPressed: isDebounce == null ? context.read<VerseConfig>().function.debounce(callback: onPressed) : onPressed,
        style: NeumorphicStyle(
          // depth: Get.width*0.01,
          // surfaceIntensity: 0,
          // intensity: 0.75,
          border: NeumorphicBorder(
              color: borderColor ?? Colors.grey.shade300,
              width: size.sizedBox1
          ),
          shadowDarkColor: Colors.grey.shade300,
          depth: size.sizedBox1,//Get.width*0.0187,
          intensity: intensity ?? 0.5,//0.86,
          surfaceIntensity: surfaceIntensity ?? 0,//0.5,
          shape: NeumorphicShape.flat,
          color: boxColor ?? yellow,
          boxShape:
          NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? size.sized16grid)),
        ),
        child: child
    );
  }
}