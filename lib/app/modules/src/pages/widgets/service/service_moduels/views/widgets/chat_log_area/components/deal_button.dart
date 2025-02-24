// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../../../../../../css/size.dart';
// import '../../../../../../../../../../routes/const_element.dart';
// import '../../../../../../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_chat_controller.dart';
// import '../../../../../../../../src_components/controllers/src_deal_controller.dart';
// import '../../../../../../../../styles/image_data.dart';
// import '../../../../../../../chat/controllers/chat_controller.dart';
// import '../../../../controllers/chat_widget_controller.dart';
//
// class DealButton extends StatelessWidget {
//   const DealButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Obx(() =>
//     BdBotNavChatController.to.roomList.firstWhere((p0) => p0.crIdx == ChatController.to.currentRoomIdx.value).crStatus != 'NORMAL'
//         ?
//         SizedBox()
//         :
//     SrcDealController.to.dealList.value.result.isEmpty ||
//         SrcDealController.to.currentEstimate
//             .where(
//                 (element) =>
//             element.deSmMId == BdBotNavChatController.to.roomList
//                 .firstWhere(
//                     (element) =>
//                 element.crIdx == ChatController.to.currentRoomIdx.value)
//                 .smMId)
//             .isEmpty
//         ?
//     SizedBox()
//         :
//     SrcDealController.to.currentEstimate
//         .firstWhere(
//             (element) =>
//         element.deSmMId == BdBotNavChatController.to.roomList
//             .firstWhere(
//                 (element) =>
//             element.crIdx == ChatController.to.currentRoomIdx.value)
//             .smMId)
//         .deSmMId
//         .contains(
//         BdBotNavChatController.to.roomList
//             .firstWhere(
//                 (element) =>
//             element.crIdx == ChatController.to.currentRoomIdx.value)
//             .smMId
//     ) && SrcDealController.to.currentEstimate.firstWhere(
//         (element) =>
//     element.deSmMId == BdBotNavChatController.to.roomList
//         .firstWhere(
//             (element) =>
//         element.crIdx == ChatController.to.currentRoomIdx.value)
//         .smMId ).dStatus != 'END' && SrcDealController.to.currentEstimate.firstWhere(
//             (element) =>
//         element.deSmMId == BdBotNavChatController.to.roomList
//             .firstWhere(
//                 (element) =>
//             element.crIdx == ChatController.to.currentRoomIdx.value)
//             .smMId).dStatus != 'NEW' && SrcDealController.to.currentEstimate.firstWhere(
//             (element) =>
//         element.deSmMId == BdBotNavChatController.to.roomList
//             .firstWhere(
//                 (element) =>
//             element.crIdx == ChatController.to.currentRoomIdx.value)
//             .smMId).dStatus != 'OPEN'
//         ?
//     !ChatWidgetController.to.confirm.value
//         ?
//     GestureDetector(
//         onTap: (){
//           ChatWidgetController.to.confirm.value = true;
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white30,
//             borderRadius: BorderRadius.circular(999),
//           ),
//           padding: EdgeInsets.all(WidgetSize(context).sizedBox5),
//           width: WidgetSize(context).sizedBox45,
//           height: WidgetSize(context).sizedBox45,
//           child: ImageData3(AppElement.iconBanana),
//         )
//     )
//         :
//     SizedBox()
//         : SizedBox(),);
//   }
//
// }
