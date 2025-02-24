import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/chat_log_bottom/chat_menu_button_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/chat_log_bottom/chat_menu_button_deal.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_route_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../declaration_chat/declaration_chat_dialog.dart';

class ChatMenuBarButton extends GetView<ChatLogController> {
  const ChatMenuBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      height: WidgetSize(context).sizedBox100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.all(WidgetSize(context).sizedBox3),
              child: ChatMenuButtonArea(
                  text: '사진 보내기', icon: Icons.image_outlined,
                  onTap: () {
                    SrcRouteController.to.gotoUpload('chat');
                  }
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.all(WidgetSize(context).sizedBox3),
              child: ChatMenuButtonDeal(),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.all(WidgetSize(context).sizedBox3),
              child: ChatMenuButtonArea(
                  text: '매장 상세보기', icon: Icons.storefront,
                  onTap: () {
                    controller.moveToDetail();
                  }
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.all(WidgetSize(context).sizedBox3),
              child: DeclarationChatDialog(declaList: [controller.roomInfo.value],),
            ),
          ),
        ],
      ),
    );
  }
}
