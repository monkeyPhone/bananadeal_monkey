import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/views/chat_view_body/chat_view_body_list/chat_view_body_list_container/chat_view_body_list_container_last_message.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/views/chat_view_body/chat_view_body_list/chat_view_body_list_container/chat_view_body_list_container_time/chat_view_body_list_container_time.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/views/chat_view_body/chat_view_body_list/chat_view_body_list_container/chat_view_body_list_image_stack/chat_view_body_list_image_stack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../../widgets/service/service_model/chat_user_room_list.dart';
import '../../../../controllers/chat_controller.dart';

class ChatViewBodyListContainer extends GetView<ChatController> {
  final RoomList room;
  final List<RoomList> roomList;
  const ChatViewBodyListContainer({
    required this.room,
    required this.roomList,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
      RippleDecorationButton(
          onTap: (){
            controller.roomClick(roomIdx: room.crIdx, isChatList: true);
          },
          inerMargin: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox7_5),
          padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
        outBorder: Border(
            bottom: BorderSide(
                width: WidgetSize(context).sizedBox0_5,
                color: Style.greyD7D7D7)),
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).width02,
          widget: Stack(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                          width: WidgetSize(context).sizedBox1,
                          color: Style.greyC4C4C4
                      ),
                    ),
                    child: ChatViewBodyListImageStack(
                      room: room,
                    ),
                  ),
                  SizedBox(width: WidgetSize(context).sizedBox14,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: WidgetSize(context).sizedBox200,
                          child: Text(room.smStoreName == '' ? '알 수 없음' : room.smStoreName , style: TextStyle(fontSize: WidgetSize(context).sizedBox18,
                            color: room.crStatus == 'NORMAL' ? Style.karajeck : Style.greyAAAAAA,
                            fontWeight: FontWeight.w700,),
                            maxLines: 1, overflow: TextOverflow.ellipsis,),
                        ),
                        SizedBox(height: WidgetSize(context).sizedBox16,),
                        Padding(
                          padding: EdgeInsets.only(
                              right: WidgetSize(context).sizedBox45
                          ),
                          child: ChatViewBodyListContainerLastMessage(room: room,),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  top: WidgetSize(context).sizedBox16,
                  right: 0,
                  child: ChatViewBodyListContainerTime(
                    room: room,
                    roomList: roomList,
                  )
              )
            ],
          ),
      );
  }
}
