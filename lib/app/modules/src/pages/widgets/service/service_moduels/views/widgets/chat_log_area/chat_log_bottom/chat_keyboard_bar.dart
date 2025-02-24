import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../controllers/chat_widget_controller.dart';

class ChatKeyboardBar extends GetView<ChatLogController> {
  final OutlineInputBorder baseBorder;
  const ChatKeyboardBar({
    required this.baseBorder,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          WidgetSize(context).sizedBox12
      ),
      color: Style.white,
      width: WidgetSize(context).widthCommon, height: WidgetSize(context).sizedBox65,
      child: Row(
        children: [
          RippleDecorationButton(
              onTap: (){
                controller.focus.unfocus();
                controller.clickMenuBar();
              },
              widget:  Icon(Icons.menu,
                color: Style.grey999999,
                size: WidgetSize(context).sizedBox32,
              ),
          ),
          Expanded(
              child:
              Padding(
                padding: EdgeInsets.only(right: WidgetSize(context).sizedBox10,left: WidgetSize(context).sizedBox10,),
                child: TextFormField(
                  onTap: (){
                    controller.menuClick.value = false;
                    ChatWidgetController.to.changeDetail(false);
                  },
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  maxLength: 5000,
                  focusNode: controller.focus,
                  controller: controller.messageController,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                      color: Style.blackWrite,
                      fontSize: WidgetSize(context).sizedBox16
                  ),
                  cursorColor: Style.yellow,
                  decoration: InputDecoration(
                      counterText: '',
                      contentPadding:
                      EdgeInsets.only(
                          left: WidgetSize(context).sizedBox14,
                          right: WidgetSize(context).sizedBox5
                      ),
                      //모든 Input 상태의 기본 스타일 세팅
                      border: baseBorder,
                      focusedBorder: baseBorder.copyWith(
                          borderSide: baseBorder.borderSide.copyWith(
                            color: Style.yellow,
                          )
                      )
                  ),
                ),
              )
          ),
          RippleDecorationButton(
              onTap: () async{
                await controller.sendMessage();
                controller.moveScrollInit();
              },
              padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
              color: Style.yellow,
              borderRadius: BorderRadius.circular(999),
              widget: Center(
                child: Text('전송',
                  style: TextStyle(
                      fontSize: WidgetSize(context).sizedBox15,
                      color: Style.brown,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
          )
        ],
      ),
    );
  }
}
