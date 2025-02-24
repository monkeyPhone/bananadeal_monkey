import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chat_log_bottom/chat_log_bottom_area.dart';

class ChatLogAreaBottom extends GetView<ChatLogController> {
  const ChatLogAreaBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((status) =>
    status.value.crStatus == 'NORMAL'
        ? ChatLogAreaBottomArea()
        : SizedBox()
        ,controller.roomInfo);
  }
}
