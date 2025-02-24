// import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/components/bd_list/deal_list_common.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../../../../../css/style.dart';
// import '../../../../../../../../../models/nav/deal/deal_status.dart';
// import '../../../../../controllers/deal_controller.dart';
// import 'deal_list_main_status_no.dart';
//
// class DealListMain extends GetView<DealController> {
//   final List<DealStatusList>  dealStatus;
//   final double width;
//   final double height;
//   const DealListMain({
//     required this.dealStatus,
//     required this.width,
//     required this.height,
//     super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       dealStatus[0].diStatus == '진행중'
//         ? DealListCommon(dealStatus: dealStatus[0], onTap: controller.pageGo(
//           context: context, index: 0, route:  0), color: Style.white, width: width, height:  height,)
//         : DealListMainStatusNo(width: width, height:  height,);
//   }
//
// }
