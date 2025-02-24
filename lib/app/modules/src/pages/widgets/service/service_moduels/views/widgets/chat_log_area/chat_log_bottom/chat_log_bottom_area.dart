import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/chat_log_bottom/chat_bottom_layout.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/chat_log_bottom/chat_keyboard_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/chat_log_bottom/chat_menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../controllers/chat_log_controller.dart';

class ChatLogAreaBottomArea extends GetView<ChatLogController> {
  const ChatLogAreaBottomArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ChatKeyboardBar(
            baseBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Style.greyCCCCCC,
                width: WidgetSize(context).sizedBox1
            )
        )
        ),
        ChatMenuBar(),
        ChatBottomLayOut()
      ],
    );
  }

}
