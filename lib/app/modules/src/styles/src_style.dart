// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../css/size.dart';
// import '../../../css/style.dart';
//
// class SrcText {
//
//   static Widget textPx24BlackDoubleLine(String text) {
//     return RichText(
//       overflow: TextOverflow.ellipsis,
//       maxLines: 2,
//       text: TextSpan(
//           text:
//           text,
//           style: TextStyle(
//             fontWeight: FontWeight.w700,
//             color: Style.blackWrite,
//             fontSize: Get.width*0.06,
//           )),
//     );
//   }
//
//   static Widget text24ResponseUnderlineBlack(String text) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: Get.width*0.06,
//         fontWeight: FontWeight.w700,
//         color: Style.blackWrite,
//         decoration: TextDecoration.underline,
//         // decorationStyle: TextDecorationStyle.wavy
//       ),
//     );
//   }
//
//   static Widget textResponseTitle22px(String text) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: Get.width*0.05,
//         fontWeight: FontWeight.w700,
//         color: Style.blackWrite
//       ),
//     );
//   }
//
//   static Widget textResponseSubTitle(String text) {
//     return Text(
//       text,
//       style: TextStyle(
//           fontSize: Get.width*0.048,
//           fontWeight: FontWeight.w600,
//           color: Style.ultimateGrey
//       ),
//     );
//   }
//
//
//   static Widget textRespone17pxGrey() {
//     return Text(
//         'ㅋ지금 바로 딜을 등록하고\n견적을 받아보세요!',
//       style: TextStyle(
//         fontSize: Get.width*0.048,
//         fontWeight: FontWeight.w700,
//         color: Style.greyWrite
//       ),
//       textAlign: TextAlign.center,
//     );
//   }
//
// }
//
//
//
// class SrcStyle {
//   static EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: Get.width*0.03, vertical: Get.width*0.035);
//   static EdgeInsets get paddingHorizontal2 => EdgeInsets.symmetric(horizontal: Get.width*0.07, vertical: Get.height*0.05);
//
//   static TextStyle get iconText => TextStyle(
//     fontSize: WidgetSize(context).sizedBox14,
//     fontWeight: FontWeight.w700,
//   );
//
//   static TextStyle get iconActiveText => TextStyle(
//     fontSize: WidgetSize(context).sizedBox14,
//     fontWeight: FontWeight.w700,
//     color: Style.blackWrite
//   );
// }
//
// class SrcAppbar {
//
//
//   static Widget appbarIcon2(var icons, color){
//     return Icon(
//       icons,
//       size: WidgetSize(context).sizedBox30,
//       color: color,
//     );
//   }
//
//   static Widget startDealAppbarIcon(var icons){
//     return Icon(
//       icons,
//       size: WidgetSize(context).sizedBox34,
//       color: Style.blackWrite,
//     );
//   }
//
//   static Widget appbarActiveIcon(var icons){
//     return Icon(
//       icons,
//       size: Get.width*0.068,
//       color: Style.yellow,
//     );
//   }
//
//   static Widget appbar2Icon(var icons){
//     return Icon(
//       icons,
//       size: Get.width*0.075,
//       color: Style.blackWrite,
//     );
//   }
//   static Widget appbar2ActiveIcon(var icons){
//     return Icon(
//       icons,
//       size: Get.width*0.075,
//       color: Style.yellow,
//     );
//   }
//
// }