import 'package:banana_deal_by_monkeycompany/app/components/default_banana.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/views/chat_view_body/chat_view_body_list/chat_view_body_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../components/loading.dart';
import '../../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_chat_controller.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BdBotNavChatController>(
        builder: (bdcC) =>
        bdcC.roomListStatus.value == 0
      ?
      bdcC.chatRoomList.isEmpty
        ? DefaultView(
          text1: '데이터를 불러오는 중입니다.',
          text2: '  ',
        )
      :
      ChatViewBodyList(
        roomList: bdcC.chatRoomList,
        controller: bdcC.scrollController,
      )
            :
        bdcC.roomListStatus.value == 200
      ?
        bdcC.chatRoomList.isEmpty
            ? DefaultView(
               text1:  '등록된 채팅이 없어요.',
               text2: '  ',
              )
            : ChatViewBodyList(
                      roomList: bdcC.chatRoomList,
                      controller: bdcC.scrollController,
                    )
            :
        bdcC.roomListStatus.value == 400
        ? DefaultView(
          text1:  '등록된 채팅이 없어요.',
          text2: '  ',
        )
            :
        DefaultBanana(
            onPressed: () async{
              await bdcC.errorInit();
            }
        )
    );
  }
}

