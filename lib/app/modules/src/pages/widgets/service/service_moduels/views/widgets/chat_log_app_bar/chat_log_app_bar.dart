import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_app_bar/chat_log_app_bar_status_normal.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_app_bar/chat_log_status_leave.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_chat_controller.dart';
import '../../../../../../chat/controllers/chat_controller.dart';
import '../chat_log_background.dart';

class ChatLogAppBar extends GetView<ChatLogController> {
  const ChatLogAppBar({
    super.key});

  @override
  Widget build(BuildContext context) {
    return BasicAppbar(
        title: ObxValue((errors) =>
            errors.value
            ? const SizedBox()
                :
            ObxValue(
                    (status) =>
                    status.value.crStatus == '' ?
                    ChatLogAppBarStatusNormal(
                      storeName: '채팅 연결중입니다...'
                    )
                    :
                    status.value.crStatus == 'NORMAL'
                    ? ChatLogAppBarStatusNormal(
                  storeName:
                  status.value.smStoreName == ''
                      ? '알 수 없음'
                      : status.value.smStoreName,
                )
                    : ChatLogStatusLeave(
                  storeName: '( ${status.value.smStoreName} )',
                )
                , controller.roomInfo)
            , controller.errorLoading),
        leading: (){

         controller.closeChatLog();
        },
        actions:
        RippleDecorationButton(
          onTap: () async{
            await controller.leaveChat(
              context: context,
            );
          },
          widget:  Row(
            children: [
              ChatLogBackground(),
              SizedBox(
                  height: WidgetSize(context).sizedBox50,
                  width: WidgetSize(context).sizedBox50,
                  child: FittedBox(
                      child: Padding(
                          padding: EdgeInsets.all(
                              WidgetSize(context).sizedBox5
                          ),
                          child:  Icon(Icons.exit_to_app, color: Style.grey999999,)))),
            ],
          ),
        ),


        // GestureDetector(
        //   onTap: () async{
        //     await controller.leaveChat(
        //       context: context,
        //       crIdx: BdBotNavChatController.to.roomList.firstWhere((element) => element.crIdx == ChatController.to.currentRoomIdx.value).crIdx,
        //       crStatus: BdBotNavChatController.to.roomList.firstWhere((element) => element.crIdx == ChatController.to.currentRoomIdx.value).crStatus,
        //     );
        //   },
        //   child: Row(
        //     children: [
        //       ChatLogBackground(),
        //       SizedBox(
        //           height: WidgetSize(context).sizedBox50,
        //           width: WidgetSize(context).sizedBox50,
        //           child: FittedBox(
        //               child: Padding(
        //                   padding: EdgeInsets.only(
        //                       top: WidgetSize(context).sizedBox5, bottom: WidgetSize(context).sizedBox5,
        //                       left: WidgetSize(context).sizedBox6_5
        //                   ),
        //                   child:  Icon(Icons.exit_to_app, color: Style.grey999999,)))),
        //     ],
        //   ),
        // )
    );
  }
}
