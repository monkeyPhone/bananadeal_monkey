import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../widgets/service/service_model/chat_user_room_list.dart';

class ChatViewBodyListContainerTimeTime extends StatelessWidget {
  final RoomList room;
  final List<RoomList> roomList;
  const ChatViewBodyListContainerTimeTime({
    required this.room,
    required this.roomList,
    super.key});

  @override
  Widget build(BuildContext context) {
    DateTime form =
    room.lastMessageTime == '' || roomList.isEmpty
        ? DateTimeConfig().now
        : DateTime.parse(room.lastMessageTime).toLocal();
    var allTime = DateFormat("yyyy-MM-dd").format(form);
    var dateTime = DateFormat("HH:mm").format(form);
    return room.lastMessageTime == ''
        ? SizedBox()
        : Text(
      form.day == DateTimeConfig().now.day
          ? dateTime
          : allTime,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox16,
          color: room.crStatus == 'NORMAL' ? Style.grey999999 : Style.greyAAAAAA,
          fontWeight: FontWeight.w400
      ),
    );
  }
}
