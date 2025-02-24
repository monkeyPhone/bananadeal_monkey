import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/image/image_dialog_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/chat_image_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_image/chat_send_image_row/chat_send_image_row.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_image/chat_send_image_row/chat_send_image_row_case_store_regdate.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_image/chat_send_image_row/chat_send_image_row_case_user_regdate.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/image_error/chat_log_image_error.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../service_model/chat_user_chat_list.dart';



class ChatSendImage extends StatelessWidget {
  final ChatLogList log;
  final ImageDialogManager imageDialogManager;
  final String thumbNail;
  const ChatSendImage({
    required this.log,
    required this.imageDialogManager,
    required this.thumbNail,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   try{
     return Container(
       width: WidgetSize(context).widthCommon,
       margin: EdgeInsets.only(bottom: WidgetSize(context).sizedBox28),
       child: ChatSendImageRow(log: log, imageDialogManager: imageDialogManager, imageInfo: chatImageInfoFromJson(log.cMessage),
         thumbNail: thumbNail,
       ),
     );
   }
   catch(_){
     return ChatLogImageError(log: log, thumbNail: thumbNail,);
   }
  }


}
