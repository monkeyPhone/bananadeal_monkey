import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/top_alert.dart';

class ChatLogTopArea extends StatelessWidget {
  const ChatLogTopArea({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLogController>(
      builder: (controller) =>
      controller.roomInfo.value.crStatus == 'NORMAL'
        ? controller.estimateList.isNotEmpty
            ? controller.estimateList.first.dStatus == 'PARTICIPATE' || controller.estimateList.first.dStatus == 'ACCEPT'
               ? TopAlert(est: controller.estimateList.first,)
               : SizedBox()
            : SizedBox()
        : SizedBox(),
    );
  }
}
