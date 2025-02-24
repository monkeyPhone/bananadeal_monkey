import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/image/image_dialog_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/chat_image_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_image/chat_send_image_row/chat_send_image_row_case_store_regdate.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_image/chat_send_image_row/image_area/chat_send_image_row_image_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_message/chat_send_message_thumbnail.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../service_model/chat_user_chat_list.dart';
import 'chat_send_image_row_case_user_regdate.dart';

class ChatSendImageRow extends StatelessWidget {
  final ChatLogList log;
  final ChatImageInfo imageInfo;
  final ImageDialogManager imageDialogManager;
  final String thumbNail;
  const ChatSendImageRow({
    required this.log,
    required this.imageInfo,
    required this.imageDialogManager,
    required this.thumbNail,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      log.cType  == 'USER'
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChatSendMessageThumbnail(log: log, thumbNail: thumbNail),
        Row(
          mainAxisAlignment:
          log.cType  == 'USER'
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ChatSendImageRowCaseUserRegdate(log: log),
            ChatSendImageRowImageArea(
              log: log,
              thumbNail: thumbNail,
              imageDialogManager: imageDialogManager,
              imageInfo: imageInfo,
              imageWidth: imageInfo.width <= imageInfo.height ?  WidgetSize(context).width038 : WidgetSize(context).width057,
            ),
            ChatSendImageRowCaseStoreRegdate(log: log)
          ],
        ),
      ],
    );
  }
}
