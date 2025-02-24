// import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/components/bd_list/deal_list/deak_list_main/deal_list_main.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../../../../css/size.dart';
// import '../../../../../../../../css/style.dart';
// import '../../../../../../../../models/nav/deal/deal_status.dart';
// import '../../../../controllers/deal_controller.dart';
//
// class DealList extends StatelessWidget{
//   final List<DealStatusList>  dealStatus;
//   const DealList({
//     required this.dealStatus,
//     super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: WidgetSize(context).paddingBodyWhole,
//           child: SizedBox(
//             width: WidgetSize(context).widthCommon,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 SizedBox(height: WidgetSize(context).sizedBox10,),
//
//               ],
//             ),
//           ),
//         ),
//         DealListMain(dealStatus: dealStatus,
//           width: WidgetSize(context).widthCommon,
//           height: WidgetSize(context).sizedBox136,)
//       ],
//     );
//   }
//
//
//
//   Widget _statusBar(String text, BuildContext context){
//     return SizedBox(
//       height: WidgetSize(context).sizedBox34,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(text, style: TextStyle(
//               fontSize: WidgetSize(context).sizedBox22,
//               fontWeight: FontWeight.w700,
//               color: Style.blackWrite,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
