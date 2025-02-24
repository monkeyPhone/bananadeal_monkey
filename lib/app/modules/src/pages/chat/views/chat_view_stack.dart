import 'package:banana_deal_by_monkeycompany/app/components/loading/home_loading_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../css/size.dart';
import '../../../../../css/style.dart';
import '../controllers/chat_controller.dart';
import 'chat_view_body/chat_view_body.dart';

class ChatViewStack extends GetView<ChatController> {
  const ChatViewStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
              color: Style.white,
              width: WidgetSize(context).widthCommon,
              height: WidgetSize(context).height60px,
              child: Row(
                children: [
                  Text('채팅',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: WidgetSize(context).sizedBox24
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ChatViewBody()
            )
          ],
        ),
        ObxValue((cl) =>
            cl.value
                ? HomeLoadingBar()
                :
            ObxValue((p0) =>
            p0.value == 3
                ? HomeLoadingBar()
                : ObxValue((dialog) =>
            dialog.value == 0
                ? SizedBox()
                : HomeLoadingBar()
                , controller.openDialog)
                , controller.openLoading)
            , controller.chatLoading)
      ],
    );
  }
}
