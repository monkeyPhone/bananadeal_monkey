import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/views/chat_view_body/chat_view_body_list/chat_view_body_list_container/chat_view_body_list_container.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/bottom_nav_bar/controllers/bd_bot_nav_chat_controller.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/service/service_model/chat_user_room_list.dart';

class ChatViewBodyList extends StatelessWidget {
  final List<RoomList> roomList;
  final ScrollController controller;
  const ChatViewBodyList({
    required this.roomList,
    required this.controller,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: roomList.length,
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          return ChatViewBodyListContainer(
                    room: roomList[index],
                    roomList: roomList,
            );
          }
        );
  }
}
