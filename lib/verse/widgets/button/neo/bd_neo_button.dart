import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neumorphic/flutter_neumorphic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdNeoButton extends StatelessWidget {
  final CommonSize size;
  final VoidCallback onPressed;
  final bool? isDebounce;
  final String text;
  final Color? boxColor;
  final Color? textColor;
  final Widget? textWidget;
  final double? width;
  final double? radius;
  final double? fontSize;
  final double? height;
  final double? depth;
  final double? intensity;
  final double? surfaceIntensity;
  final Color? shadowColor;
  const BdNeoButton({
    super.key,
    required this.size,
    this.isDebounce,
    required this.onPressed,
    required this.text,
    this.boxColor,
    this.textColor,
    this.textWidget,
    this.width,
    this.height,
    this.radius,
    this.fontSize,
    this.depth,
    this.intensity,
    this.surfaceIntensity,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? size.sizedButtonNew,
      width: width ?? size.widthCommon,
      child: NeumorphicButton(
        onPressed: isDebounce == null ? context.read<VerseConfig>().function.debounce(callback: onPressed) : onPressed,
        style: NeumorphicStyle(
          // depth: Get.width*0.01,
          // surfaceIntensity: 0,
          // intensity: 0.75,

          shadowDarkColor: boxColor == null ? yellow.withOpacity(0.8)  : boxColor!.withOpacity(0.8) ,
          depth: depth ?? size.etc01,//Get.width*0.0187,
          intensity: intensity ?? 0.6,//0.86,
          surfaceIntensity: surfaceIntensity ?? 0,//0.5,
          shape: NeumorphicShape.flat,
          color: boxColor ?? yellow,
          boxShape:
          NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? size.widthCommon)),
        ),
        child: textWidget ?? Center(child:
        Text(text, style: TextStyle(fontSize: fontSize ?? size.titleLittle, color: textColor ?? brown, fontWeight: FontWeight.w400),
        )
        ),
      ),
    );
  }
}