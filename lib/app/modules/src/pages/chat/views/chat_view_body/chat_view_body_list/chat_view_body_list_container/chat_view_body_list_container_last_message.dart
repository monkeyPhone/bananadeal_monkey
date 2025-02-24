import 'package:flutter/material.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../../widgets/service/service_model/chat_user_room_list.dart';

class ChatViewBodyListContainerLastMessage extends StatelessWidget {
  final RoomList room;
  const ChatViewBodyListContainerLastMessage({
    required this.room,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
        room.lastMessage.contains('{"imageUrl":"UPLOAD') || room.lastMessage.contains('UPLOAD/IMAGES')
          ?  '사진을 보냈습니다.'
          :  room.lastMessage.contains('SEND/DEAL/ACCEPT')
                ?  '딜을 수락했어요 (알림창)'
                :  room.lastMessage.contains('SEND/DEAL/INVITATION/')
                      ?  '초대장을 보냈습니다.'
                      :  room.lastMessage == '' && room.lastMessageTime == ''
                           ?  '아직 대화가 없어요 채팅을 시작해보세요 '
                           :  room.lastMessage,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: room.crStatus == 'NORMAL' ? Style.karajeck : Style.greyAAAAAA,
          fontSize: WidgetSize(context).sizedBox16,
          fontWeight: FontWeight.w400
      ),
    );
  }
}
