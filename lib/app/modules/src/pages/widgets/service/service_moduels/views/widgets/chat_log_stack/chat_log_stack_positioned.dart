import 'package:banana_deal_by_monkeycompany/app/components/default_banana.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/controllers/chat_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatLogStackPositioned extends GetView<ChatLogController> {
  const ChatLogStackPositioned({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: ObxValue((load) =>
          load.value
            ? Container(
            color: Colors.black54,
              child: SizedBox()
          )
              :
            ObxValue(
                    (error) =>
                !error.value
                    ? SizedBox()
                    : Container(
                  color: Colors.black87,
                  child: DefaultBananaStack(onPressed: () async{
                    await controller.reconnectButton();
                  }),
                )
                , controller.errorLoading)
            , controller.loading)
    );
  }
}
