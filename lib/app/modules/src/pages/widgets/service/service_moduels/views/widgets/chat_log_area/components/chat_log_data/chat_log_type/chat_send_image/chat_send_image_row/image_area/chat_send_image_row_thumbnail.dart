import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../../../../../../../routes/const_element.dart';
import '../../../../../../../../../../service_model/chat_user_chat_list.dart';

class ChatSendImageRowThumbnail extends GetView<ChatLogController> {
  final ChatLogList log;
  final String thumbNail;
  const ChatSendImageRowThumbnail({
    required this.log,
    required this.thumbNail,
    super.key});

  @override
  Widget build(BuildContext context) {
    return log.cMessage.contains('UPLOAD/IMAGES/')
            ? log.cType == 'USER'
                ? SizedBox()
                : GestureDetector(
                       onTap: (){
                          controller.moveToDetail();
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(999),
                          child: ImageProviders(
                              imageHeight: WidgetSize(context).sizedBox50,
                              imageWidth: WidgetSize(context).sizedBox50,
                              imageUrl: ApiConsole.imageBananaUrl+ thumbNail,
                              errUrl: AppElement.defaultStore,
                              imageLabel: AppElement.caseThumb
                          )

                      ),
                  )
            : SizedBox();
  }
}
