import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_image/chat_send_image_row/chat_send_image_row_case_store_regdate.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_image/chat_send_image_row/chat_send_image_row_case_user_regdate.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_message/chat_message_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../service_model/chat_user_chat_list.dart';

class ChatSendMessageMessageArea extends StatelessWidget {
  final ChatLogList log;
  final double pad;
  final double pad2;
  final double maxWidth;
  final Color colors;
  const ChatSendMessageMessageArea({
    required this.log,
    required this.pad,
    required this.pad2,
    required this.maxWidth,
    required this. colors,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: WidgetSize(context).sizedBox8,
        ),
        ChatSendImageRowCaseUserRegdate(log: log),
        SizedBox(width: pad,),
        Container(
          constraints: BoxConstraints(
              minHeight: WidgetSize(context).etc08,
              maxHeight: double.infinity,
              maxWidth: maxWidth
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox14),
              color: colors
          ),
          padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox12, vertical: WidgetSize(context).sizedBox12,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChatMessageWidget(log: log)
            ],
          ),
        ),
        SizedBox(
            width: pad2
        ),
        ChatSendImageRowCaseStoreRegdate(log: log)
      ],
    );
  }
}
