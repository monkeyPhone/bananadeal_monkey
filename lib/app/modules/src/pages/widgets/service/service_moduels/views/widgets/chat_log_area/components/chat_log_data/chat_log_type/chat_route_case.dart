import 'package:banana_deal_by_monkeycompany/app/managers/image/image_dialog_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/image_error/chat_log_image_error.dart';
import 'package:flutter/material.dart';
import '../../../../../../../service_model/chat_user_chat_list.dart';
import 'chat_accept.dart';
import 'chat_send_image/chat_send_image.dart';
import 'chat_send_invited.dart';
import 'chat_send_leave.dart';
import 'chat_send_message/chat_send_message.dart';

class ChatRouteCase extends StatelessWidget {
  final ChatLogList log;
  final String thumbNail;
  final ImageDialogManager imageDialogManager;
  const ChatRouteCase({
    required this.log,
    required this.imageDialogManager,
    required this.thumbNail,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  log.cMessage.contains('SEND/DEAL/ACCEPT')
              ? ChatAccept(log: log,)
              : log.cMessage.contains('{"imageUrl":"UPLOAD')
                  ? ChatSendImage(log: log, imageDialogManager: imageDialogManager,thumbNail: thumbNail)
                  : log.cMessage.contains('SEND/DEAL/INVITATION')
                      ? ChatSendInvited()
                      : log.cMessage.contains('님이 채팅을 종료했어요')
                          ? ChatSendLeave()
                          : log.cMessage.contains('UPLOAD/IMAGES/')
        ? ChatLogImageError(log: log, thumbNail: thumbNail,)
        : ChatSendMessage(log: log,thumbNail : thumbNail);
  }
}
