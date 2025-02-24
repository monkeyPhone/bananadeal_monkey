import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/chat_log_stack.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_app_bar/chat_log_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';


class ChatLogView extends GetView<ChatLogController>{
  const ChatLogView({
    Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    try{
      return GestureDetector(
          onTapCancel: (){
            controller.isHiddenFalse();
          },
          onTap: (){
            controller.focus.unfocus();
            controller.isHiddenFalse();
          },
          child:
          BasicCanvas(
            canPop: false,
            onPopInvoked: (bool didPop, Object? result){
              if(didPop){
                return;
              }
              controller.closeChatLog();
            },
            body: Column(
              children: [
                ChatLogAppBar(),
                Expanded(
                    child: ChatLogStack()
                )
              ],
            ),
            bottomNavigationBar: SafeArea(
              bottom: MediaQuery.of(context).viewInsets.bottom == 0,
              child: Container(
                color: Style.white,
                child: SizedBox(
                  height: WidgetSize(context).sizedBox2,
                ),
              ),
            ),
          )
      );
    }catch(_){
      return SizedBox();
    }
  }

}
