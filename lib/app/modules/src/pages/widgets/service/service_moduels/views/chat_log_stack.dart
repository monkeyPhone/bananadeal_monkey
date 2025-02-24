import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/chat_log_area.dart';
import 'package:flutter/material.dart';
import 'widgets/chat_log_stack/chat_log_stack_positioned.dart';

class ChatLogStack extends StatelessWidget {
  const ChatLogStack({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        ChatLogArea(),
        ChatLogStackPositioned()
      ],
    );
  }
}
