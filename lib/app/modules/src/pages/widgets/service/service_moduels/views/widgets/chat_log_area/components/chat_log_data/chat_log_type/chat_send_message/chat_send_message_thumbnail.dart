import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../../../../../routes/const_element.dart';
import '../../../../../../../../service_model/chat_user_chat_list.dart';
import '../../../../../../../controllers/chat_log_controller.dart';

class ChatSendMessageThumbnail extends StatelessWidget {
  final ChatLogList log;
  final String thumbNail;
  const ChatSendMessageThumbnail({
    required this.log,
    required this.thumbNail,
    super.key});

  @override
  Widget build(BuildContext context) {
    return log.cType == 'USER'
            ? SizedBox()
            : GestureDetector(
                  onTap: (){
                    if(Get.isSnackbarOpen == true){
                        Get.back();
                      }
                    else{
                      ChatLogController.to.moveToDetail();
                      }
                    },
              child: Padding(
                padding: EdgeInsets.only(right: WidgetSize(context).sizedBox3),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: ImageProviders(
                        imageHeight: WidgetSize(context).sizedBox50,
                        imageWidth: WidgetSize(context).sizedBox50,
                        imageUrl: '${ApiConsole.imageBananaUrl}$thumbNail',
                        errUrl: AppElement.defaultStore,
                        imageLabel: AppElement.caseThumb
                    )
                ),
              ),
    );
  }
}
