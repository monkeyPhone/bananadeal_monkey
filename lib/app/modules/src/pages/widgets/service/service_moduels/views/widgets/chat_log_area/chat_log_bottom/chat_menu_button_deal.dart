import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import 'chat_menu_button_area.dart';

class ChatMenuButtonDeal extends GetView<ChatLogController> {
  const ChatMenuButtonDeal({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLogController>(
      builder: (clc)=>
      clc.roomInfo.value.isDealing == 0
          ?
      ChatMenuButtonArea(text: '딜 초대하기', icon: Icons.mail_outline_outlined,
          onTap: () async{
            if(Get.isSnackbarOpen){
              Get.back();
            }else{
              await controller.invitedDeal(context);

              controller.send.value = 10;
            }
          }
      )
          :
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mark_email_read_outlined, size: WidgetSize(context).sizedBox40, color: Style.ultimateGrey,),
          SizedBox(height: WidgetSize(context).sizedBox8,),
          Text('초대완료',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: WidgetSize(context).sizedBox14,
                color: Style.ultimateGrey
            ),
          )
        ],
      ),
    );
  }
}
