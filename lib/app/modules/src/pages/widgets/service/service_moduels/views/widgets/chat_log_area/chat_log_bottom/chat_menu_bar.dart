import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/chat_log_bottom/chat_menu_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';

class ChatMenuBar extends GetView<ChatLogController> {
  const ChatMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((click) =>
    !click.value
        ? Container(
            color: Style.white,
            height: WidgetSize(context).sizedBox2*2,
          )
        : ChatMenuBarButton()
        , controller.menuClick);
  }
}
