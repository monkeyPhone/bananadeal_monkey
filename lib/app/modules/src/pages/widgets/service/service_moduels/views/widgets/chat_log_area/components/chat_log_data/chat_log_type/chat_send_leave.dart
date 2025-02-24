import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../routes/const_element.dart';
import '../../../../../../../../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_chat_controller.dart';
import '../../../../../../../../../chat/controllers/chat_controller.dart';

class ChatSendLeave extends GetView<ChatLogController> {
  const ChatSendLeave({
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: WidgetSize(context).sizedBox28),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                minHeight: WidgetSize(context).sizedBox34,
                maxHeight: double.infinity,
                minWidth: WidgetSize(context).widthCommon,
                maxWidth: WidgetSize(context).widthCommon

            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
                color: Style.yellow
            ),
            padding: EdgeInsets.all(WidgetSize(context).sizedBox1),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox6_5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
                color: Style.white,
              ),
              child: ObxValue((room) =>
                  room.value.crIdx == 0
                  ?Center(
                    child: CircularProgressIndicator(
                      color: Style.yellow,
                    ),
                  )
                      :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _svgPic(AppElement.iconBanana, context),
                      _pad8(context),
                      Expanded(
                        child: Text('${room.value.smStoreName}님이 채팅을 종료했어요.',
                          style: TextStyle(fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w400, color: Style.brown),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      _pad8(context),
                      _svgPic(AppElement.iconBanana2, context),
                    ],
                  )
                  , controller.roomInfo),
            ),
          ),
        ],
      ),
    );

  }

  Widget _pad8(BuildContext context){
    return SizedBox(
      width: WidgetSize(context).sizedBox8,
    );
  }

  Widget _svgPic(String asset,BuildContext context){
    return SvgPicture.asset(asset, width: WidgetSize(context).sizedBox14, height: WidgetSize(context).sizedBox13,);
  }



}
