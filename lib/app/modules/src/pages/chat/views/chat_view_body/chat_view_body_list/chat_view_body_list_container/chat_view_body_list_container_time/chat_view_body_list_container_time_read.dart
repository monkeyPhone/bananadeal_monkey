import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../widgets/service/service_model/chat_user_room_list.dart';

class ChatViewBodyListContainerTimeRead extends StatelessWidget {
  final RoomList room;
  const ChatViewBodyListContainerTimeRead({
    required this.room,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
      room.cIsRead == 0
          ? SizedBox()
          : Container(
              padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox9_5, vertical: WidgetSize(context).etc012),
              decoration: BoxDecoration(
                color: Style.yellow,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                room.cIsRead.toString(),
                style: TextStyle(
                    fontSize: WidgetSize(context).sizedBox14,
                    color: Style.brown),
              )
    );
  }
}
