import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/controllers/chat_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_user_room_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';


class DeclarationChatDialog extends StatelessWidget {
  final List<RoomList> declaList;
  const DeclarationChatDialog({
    required this.declaList,
    Key? key}) : super(key: key,
  );

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: (){
          ChatController.to.changeChatDeclaration(declaList);
        },
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon( Icons.notifications_active_outlined, size: WidgetSize(context).sizedBox37, color: Style.karajeck,),
            SizedBox(height: WidgetSize(context).sizedBox8,),
            Text('신고하기',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: WidgetSize(context).sizedBox14,
                  color: Style.karajeck
              ),
            )
          ],
        )
    );
  }
}
