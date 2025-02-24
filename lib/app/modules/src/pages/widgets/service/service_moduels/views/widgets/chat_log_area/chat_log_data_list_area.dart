import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/controllers/chat_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/chat_log_data/chat_log_data.dart';

class ChatLogDataListArea extends StatelessWidget {
  const ChatLogDataListArea({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLogController>(
        builder: (controller) =>
            Scrollbar(
                controller: controller.chatScrollController,
                child:  GetBuilder<ChatController>(
                    builder: (cont)=>
                        ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.only(top: WidgetSize(context).sizedBox24,),
                            // addRepaintBoundaries: false,
                            dragStartBehavior: DragStartBehavior.start,
                            controller: controller.chatScrollController,
                            itemCount: cont.showLog.length,
                            itemBuilder: (BuildContext context, int index) =>
                              ChatLogData(
                                thumbNail: controller.roomInfo.value.smPathImg0,
                                imageDialogManager: cont.imageDialogManager,
                                index: index,
                                log: cont.showLog.reversed.toList(),
                                key: ValueKey('${cont.showLog[index].cRegdate}_$index'),
                            )
                        )

                )
            )
    );
  }
}
