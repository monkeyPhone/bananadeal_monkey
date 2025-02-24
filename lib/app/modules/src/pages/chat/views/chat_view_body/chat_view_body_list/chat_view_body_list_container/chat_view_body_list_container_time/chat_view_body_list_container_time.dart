import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/views/chat_view_body/chat_view_body_list/chat_view_body_list_container/chat_view_body_list_container_time/chat_view_body_list_container_time_read.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/views/chat_view_body/chat_view_body_list/chat_view_body_list_container/chat_view_body_list_container_time/chat_view_body_list_container_time_time.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../widgets/service/service_model/chat_user_room_list.dart';

class ChatViewBodyListContainerTime extends StatelessWidget {
  final RoomList room;
  final List<RoomList> roomList;
  const ChatViewBodyListContainerTime({
    required this.room,
    required this.roomList,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
    //BANANA FIX
      Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ChatViewBodyListContainerTimeTime(
            room: room,
            roomList: roomList
        ),
        SizedBox(height: WidgetSize(context).sizedBox10_5,),
        roomList.isNotEmpty && (room.crStatus == 'NORMAL'  || room.crStatus == 'STORE_EXIT')
            ?
       ChatViewBodyListContainerTimeRead(room: room)
            : const SizedBox()
      ],
    ) ;
  }
}
