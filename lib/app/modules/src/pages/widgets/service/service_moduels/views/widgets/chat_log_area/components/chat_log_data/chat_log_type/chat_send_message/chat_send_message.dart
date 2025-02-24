import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_message/chat_send_message_thumbnail.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../service_model/chat_user_chat_list.dart';
import 'chat_send_message_message_area.dart';

class ChatSendMessage extends StatelessWidget {
  final ChatLogList log;
  final String thumbNail;
  const ChatSendMessage({
    required this.log,
    required this.thumbNail,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: WidgetSize(context).sizedBox28),
      child:  Row(
        mainAxisAlignment:
        log.cType == 'USER'
            ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChatSendMessageThumbnail(log: log, thumbNail: thumbNail),
          Padding(
            padding: EdgeInsets.only(
                top: log.cType == 'USER'
                    ? 0 : WidgetSize(context).chatBoxPadding
            ),
            child: ChatSendMessageMessageArea(
                log: log,
                pad: log.cType == 'USER'
                     ? WidgetSize(context).etc01 : 0,
                pad2: log.cType == 'USER'
                    ? 0 : WidgetSize(context).etc01,
                maxWidth: log.cType == 'USER'
                           ? WidgetSize(context).chatMaxWidth075
                           : WidgetSize(context).chatMaxWidth065,
              colors: log.cType == 'USER'
                  ? Style.yellow : Style.white,
            ),
          )
        ],
      ),
    );
  }
}
