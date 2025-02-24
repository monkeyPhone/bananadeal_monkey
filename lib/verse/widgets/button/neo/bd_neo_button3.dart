import 'dart:async';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neumorphic/flutter_neumorphic.dart';


class BdNeoButton3 extends StatelessWidget {
  final CommonSize size;
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
  const BdNeoButton3({super.key,
    required this.size,
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: size.sized16grid, ),
      padding: EdgeInsets.all(size.sizedBox1_5),
      decoration: BoxDecoration(
          color: ultimateGrey,
          borderRadius: BorderRadius.circular(borderRadius)
      ),
      height: size.sizedAppbar,
      width: size.sizedAppbar,
      child: NeumorphicButton(
        onPressed: () {
          {
            Timer(const Duration(milliseconds: 200),
                onPressed
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
          color: boxColor ?? yellow,
          boxShape:
          NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? borderRadius)),
        ),
        child: const SizedBox(),
      ),
    );
  }
}