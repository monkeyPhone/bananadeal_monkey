import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/chat_log_area_bottom.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/chat_log_top_area.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import 'chat_log_data_list_area.dart';
import 'components/chat_scroll_down.dart';




class ChatLogArea extends StatelessWidget {
  const ChatLogArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              //TODO: 기획적으로 변경사항 잇음 => 나중에 고쳐야됨.
              ChatLogTopArea(),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                        child:
                        Stack(
                          children: [
                            Container(
                              height: WidgetSize(context).heightCommon,
                              width: WidgetSize(context).widthCommon,
                              color: Style.greyEAEAEA,
                              child: ChatLogDataListArea(),
                            ),
                            ChatScrolldown(),
                          ],
                        )
                    ),
                    ChatLogAreaBottom()
                  ],
                ),
                // Column(
                //   children: [
                //     Expanded(
                //         child:
                //         Stack(
                //           children: [
                //             Container(
                //               height: WidgetSize(context).heightCommon,
                //               width: WidgetSize(context).widthCommon,
                //               color: Style.greyEAEAEA,
                //               child: ChatLogDataListArea(),
                //             ),
                //             TopHiddenText(),
                //             ChatScrolldown(),
                //             Positioned(
                //               top: WidgetSize(context).sizedBox16,
                //               right: WidgetSize(context).sizedBox16,
                //                 child: DealButton()
                //             )
                //           ],
                //         )
                //     ),
                //     ChatLogAreaBottom()
                //   ],
                // ),
              ),

            ],
          );
  }
}
