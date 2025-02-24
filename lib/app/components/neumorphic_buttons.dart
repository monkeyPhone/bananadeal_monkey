import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/neumorphic/flutter_neumorphic.dart';
import '../css/size.dart';
import '../css/style.dart';



class NeumorphicButtons extends StatelessWidget {
  final Color? boxColor;
  final Color? textColor;
  final Widget? textWidget;
  final String text;
  final double? width;
  final double? radius;
  final double? height;
  final double? depth;
  final double? intensity;
  final double? surfaceIntensity;
  final VoidCallback onPressed;
  final Color? shadowColor;
  final bool? isAnimated;
  const NeumorphicButtons({
    this.boxColor,
    this.textColor,
    this.textWidget,
    required this.text,
    this.width,
    this.height,
    this.radius,
    required this.onPressed,
    this.depth,
    this.intensity,
    this.surfaceIntensity,
    this.shadowColor,
    this.isAnimated,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? WidgetSize(context).height60px,
      width: width ?? WidgetSize(context).widthCommon,
      child: NeumorphicButton(
        onPressed: AppOutsFunction().debounce2(callback:() {
          {
            Timer(const Duration(milliseconds: 150),
                onPressed
            );

          }
        }),
        style: NeumorphicStyle(
          // depth: Get.width*0.01,
          // surfaceIntensity: 0,
          // intensity: 0.75,

          shadowDarkColor: boxColor == null ? Style.yellow.withValues(alpha: 0.8)  : boxColor!.withValues(alpha: 0.8) ,
          depth: depth ?? WidgetSize(context).etc01,//Get.width*0.0187,
          intensity: intensity ?? 0.6,//0.86,
          surfaceIntensity: surfaceIntensity ?? 0,//0.5,
          shape: NeumorphicShape.flat,
          color: boxColor ?? Style.yellow,
          boxShape:
          NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? WidgetSize(context).widthCommon)),
        ),
        child:
        isAnimated != null
            ? Center(
              child: DefaultTextStyle(
                style: TextStyle(
                  color: textColor ?? Style.brown,
                  fontSize: WidgetSize(context).sizedBox19,
                  fontWeight: FontWeight.w600,
                ),
                child: AnimatedTextKit(
                  pause: const Duration(milliseconds: 600),
                  repeatForever: true,
                  animatedTexts: [
                    FadeAnimatedText(text),
                  ],
                ),
              ),
            )
            :
        textWidget ?? Center(child:
        Text(text, style: TextStyle(fontSize: WidgetSize(context).sizedBox18, color: textColor ?? Style.brown, fontWeight: FontWeight.w400),
        )
        ),
      ),
    );
  }
}

class NeumorphicButtons2 extends StatelessWidget {
  final Color? boxColor;
  final Color? textColor;
  final Widget? textWidget;
  final String text;
  final double? width;
  final double? radius;
  final double? height;
  final double? depth;
  final double? intensity;
  final double? surfaceIntensity;
  final VoidCallback onPressed;
  final Color? shadowColor;
  final double borderRadius;
  const NeumorphicButtons2({
    this.boxColor,
    this.textColor,
    this.textWidget,
    required this.text,
    this.width,
    this.height,
    this.radius,
    required this.onPressed,
    this.depth,
    this.intensity,
    this.surfaceIntensity,
    this.shadowColor,
    required this.borderRadius,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: WidgetSize(context).sizedBox10, bottom: WidgetSize(context).sizedBox5),
      padding: EdgeInsets.all(WidgetSize(context).sizedBox1),
      decoration: BoxDecoration(
          color: Style.ultimateGrey,
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      height: WidgetSize(context).height60px,
      width: WidgetSize(context).height60px,
      child: NeumorphicButton(
        onPressed: () {
          {
            Timer(const Duration(milliseconds: 200),
                const AppOutsFunction().debounce(callback: onPressed)
            );

          }
        },
        style: NeumorphicStyle(
          // depth: Get.width*0.01,
          // surfaceIntensity: 0,
          // intensity: 0.75,
          shadowDarkColor: Colors.black87,
          depth: depth,
          intensity: 0.86,//0.86,
          surfaceIntensity: 0,//0.5,
          shape: NeumorphicShape.concave,
          color: boxColor ?? Style.yellow,
          boxShape:
          NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? borderRadius)),
        ),
        child: const SizedBox(),
      ),
    );
  }
}
