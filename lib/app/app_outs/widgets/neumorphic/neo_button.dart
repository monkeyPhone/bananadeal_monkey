// import 'dart:async';

// import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
// import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/neumorphic/flutter_neumorphic.dart';
// import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
// import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
// import 'package:flutter/material.dart';
//
//
// class NeoButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final bool? isDebounce;
//   final String text;
//   final Color? boxColor;
//   final Color? textColor;
//   final Widget? textWidget;
//   final double? width;
//   final double? radius;
//   final double? height;
//   final double? depth;
//   final double? intensity;
//   final double? surfaceIntensity;
//   final Color? shadowColor;
//   const NeoButton({
//     super.key,
//     this.isDebounce,
//     required this.onPressed,
//     required this.text,
//     this.boxColor,
//     this.textColor,
//     this.textWidget,
//     this.width,
//     this.height,
//     this.radius,
//     this.depth,
//     this.intensity,
//     this.surfaceIntensity,
//     this.shadowColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height ?? WidgetSize(context).sizedButton,
//       width: width ?? WidgetSize(context).widthCommon,
//       child: NeumorphicButton(
//         onPressed: isDebounce == null ? const AppOutsFunction().debounce(callback: onPressed) : onPressed,
//         style: NeumorphicStyle(
//           // depth: Get.width*0.01,
//           // surfaceIntensity: 0,
//           // intensity: 0.75,
//
//           shadowDarkColor: boxColor == null ? Style.yellow.withOpacity(0.8)  : boxColor!.withOpacity(0.8) ,
//           depth: depth ?? WidgetSize(context).etc01,//Get.width*0.0187,
//           intensity: intensity ?? 0.6,//0.86,
//           surfaceIntensity: surfaceIntensity ?? 0,//0.5,
//           shape: NeumorphicShape.flat,
//           color: boxColor ?? Style.yellow,
//           boxShape:
//           NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? WidgetSize(context).widthCommon)),
//         ),
//         child: textWidget ?? Center(child:
//         Text(text, style: TextStyle(fontSize: WidgetSize(context).titleButton, color: textColor ?? Style.brown, fontWeight: FontWeight.w400),
//         )
//         ),
//       ),
//     );
//   }
// }
//
//
// class NeoButton2 extends StatelessWidget {
//   final VoidCallback onPressed;
//   final bool? isDebounce;
//   final Color? boxColor;
//   final Color? textColor;
//   final Widget? textWidget;
//   final double? width;
//   final double? radius;
//   final double? height;
//   final double? depth;
//   final double? intensity;
//   final double? surfaceIntensity;
//   final Color? shadowColor;
//   const NeoButton2({
//     super.key,
//     this.isDebounce,
//     required this.onPressed,
//     this.boxColor,
//     this.textColor,
//     this.textWidget,
//     this.width,
//     this.height,
//     this.radius,
//     this.depth,
//     this.intensity,
//     this.surfaceIntensity,
//     this.shadowColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return NeumorphicButton(
//       onPressed: isDebounce == null ?
//       const AppOutsFunction().debounce(callback: onPressed) : onPressed,
//         // style: NeumorphicStyle(
//         //   shadowLightColor: Style.happy.withOpacity(0.7),
//         //   shadowDarkColor: Style.blackWrite.withOpacity(0.8),
//         //   depth: 2,
//         //   intensity: 0.86,
//         //   surfaceIntensity: 0.5,
//         //   shape: NeumorphicShape.flat,
//         //   color: Style.white,
//         //   boxShape:
//         //   NeumorphicBoxShape.roundRect(BorderRadius.circular(WidgetSize(context).width003)),
//         // ),
//       style: NeumorphicStyle(
//         // depth: Get.width*0.01,
//         // surfaceIntensity: 0,
//         // intensity: 0.75,
//         // shadowLightColor: Style.grey,
//         shadowDarkColor: Style.bananaBack,
//         depth: 3,//Get.width*0.0187,
//         intensity: intensity ?? 0.5,//0.86,
//         surfaceIntensity: surfaceIntensity ?? 0,//0.5,
//         shape: NeumorphicShape.flat,
//         color: boxColor ?? Style.yellow,
//         boxShape:
//         NeumorphicBoxShape.roundRect(BorderRadius.circular(WidgetSize(context).sizedBox10)),
//       ),
//       child: textWidget
//     );
//   }
// }
//
// class NeoButton3 extends StatelessWidget {
//   final Color? boxColor;
//   final Color? textColor;
//   final Widget? textWidget;
//   final String text;
//   final double? width;
//   final double? radius;
//   final double? height;
//   final double? depth;
//   final double? intensity;
//   final double? surfaceIntensity;
//   final VoidCallback onPressed;
//   final Color? shadowColor;
//   final double borderRadius;
//   const NeoButton3({super.key,
//     this.boxColor,
//     this.textColor,
//     this.textWidget,
//     required this.text,
//     this.width,
//     this.height,
//     this.radius,
//     required this.onPressed,
//     this.depth,
//     this.intensity,
//     this.surfaceIntensity,
//     this.shadowColor,
//     required this.borderRadius,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: WidgetSize(context).sizedBox16, ),
//       padding: EdgeInsets.all(WidgetSize(context).sizedBox1_5),
//       decoration: BoxDecoration(
//           color: Style.ultimateGrey,
//           borderRadius: BorderRadius.circular(borderRadius)
//       ),
//       height: WidgetSize(context).height60px,
//       width: WidgetSize(context).height60px,
//       child: NeumorphicButton(
//         onPressed: () {
//           {
//             Timer(const Duration(milliseconds: 200),
//                 onPressed
//             );
//
//           }
//         },
//         style: NeumorphicStyle(
//           // depth: Get.width*0.01,
//           // surfaceIntensity: 0,
//           // intensity: 0.75,
//           shadowDarkColor: Colors.black87,
//           depth: depth,
//           intensity: 0.86,//0.86,
//           surfaceIntensity: 0,//0.5,
//           shape: NeumorphicShape.concave,
//           color: boxColor ?? Style.yellow,
//           boxShape:
//           NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? borderRadius)),
//         ),
//         child: const SizedBox(),
//       ),
//     );
//   }
// }
//
//
// class NeoButtonCustom extends StatelessWidget {
//   final VoidCallback onPressed;
//   final bool? isDebounce;
//   final Color? boxColor;
//   final Color? textColor;
//   final Color? borderColor;
//   final Widget? textWidget;
//   final double? width;
//   final double? radius;
//   final double? height;
//   final double? depth;
//   final double? intensity;
//   final double? surfaceIntensity;
//   final Color? shadowColor;
//   final EdgeInsets? padding;
//   final EdgeInsets? margin;
//   const NeoButtonCustom({
//     super.key,
//     this.isDebounce,
//     required this.onPressed,
//     this.boxColor,
//     this.textColor,
//     this.borderColor,
//     this.textWidget,
//     this.width,
//     this.height,
//     this.radius,
//     this.depth,
//     this.intensity,
//     this.surfaceIntensity,
//     this.shadowColor,
//     this.padding,
//     this.margin
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return NeumorphicButton(
//       padding: padding ?? EdgeInsets.all(WidgetSize(context).sizedBox8),
//       margin: margin,
//         onPressed: isDebounce == null ? const AppOutsFunction().debounce(callback: onPressed) : onPressed,
//         style: NeumorphicStyle(
//           // depth: Get.width*0.01,
//           // surfaceIntensity: 0,
//           // intensity: 0.75,
//           border: NeumorphicBorder(
//             color: borderColor ?? Colors.grey.shade300,
//             width: WidgetSize(context).sizedBox1
//           ),
//           shadowDarkColor: Colors.grey.shade300,
//           depth:WidgetSize(context).sizedBox1,//Get.width*0.0187,
//           intensity: intensity ?? 0.5,//0.86,
//           surfaceIntensity: surfaceIntensity ?? 0,//0.5,
//           shape: NeumorphicShape.flat,
//           color: boxColor ?? Style.yellow,
//           boxShape:
//           NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? WidgetSize(context).sizedBox16)),
//         ),
//         child: textWidget
//     );
//   }
// }
//
//
// class NeoButtonRe extends StatelessWidget {
//   final VoidCallback onPressed;
//   final bool? isDebounce;
//   final Color? boxColor;
//   final Color? textColor;
//   final Color? borderColor;
//   final Widget? textWidget;
//   final double? width;
//   final double? radius;
//   final double? height;
//   final double? depth;
//   final double? intensity;
//   final double? surfaceIntensity;
//   final Color? shadowColor;
//   const NeoButtonRe({
//     super.key,
//     this.isDebounce,
//     required this.onPressed,
//     this.boxColor,
//     this.textColor,
//     this.borderColor,
//     this.textWidget,
//     this.width,
//     this.height,
//     this.radius,
//     this.depth,
//     this.intensity,
//     this.surfaceIntensity,
//     this.shadowColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return NeumorphicButton(
//         onPressed: isDebounce == null ?  const AppOutsFunction().debounce(callback: onPressed) : onPressed,
//         style: NeumorphicStyle(
//           // depth: Get.width*0.01,
//           // surfaceIntensity: 0,
//           // intensity: 0.75,
//           shadowDarkColor: Colors.grey.shade400,
//           depth: WidgetSize(context).sizedBox1,//Get.width*0.0187,
//           intensity: intensity ?? 0.5,//0.86,
//           surfaceIntensity: surfaceIntensity ?? 0,//0.5,
//           shape: NeumorphicShape.flat,
//           color: boxColor ?? Style.white,
//         ),
//         child: textWidget
//     );
//   }
// }



