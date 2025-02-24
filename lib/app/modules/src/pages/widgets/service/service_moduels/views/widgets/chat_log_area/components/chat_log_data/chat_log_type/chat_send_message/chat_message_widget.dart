import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/image_error/chat_log_image_error.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../service_model/chat_user_chat_list.dart';

class ChatMessageWidget extends StatelessWidget {
  final ChatLogList log;
  const ChatMessageWidget({
    required this.log,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(log.cMessage,
      style: TextStyle(fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w400),
    );
  }
}
