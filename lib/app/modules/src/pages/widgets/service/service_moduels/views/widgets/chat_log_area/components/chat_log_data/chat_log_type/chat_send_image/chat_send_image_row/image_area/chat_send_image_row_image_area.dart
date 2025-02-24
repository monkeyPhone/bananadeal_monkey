import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/out_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/image/image_dialog_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/chat_image_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_image/chat_send_image_row/image_area/chat_send_image_row_thumbnail.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../../../../../../../routes/const_element.dart';
import '../../../../../../../../../../service_model/chat_user_chat_list.dart';

class ChatSendImageRowImageArea extends StatelessWidget {
  final ChatLogList log;
  final String thumbNail;
  final ChatImageInfo imageInfo;
  final ImageDialogManager imageDialogManager;
  final double imageWidth;
  const ChatSendImageRowImageArea({
    required this.log,
    required this.imageDialogManager,
    required this.imageInfo,
    required this.thumbNail,
    required this.imageWidth,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChatSendImageRowThumbnail(log: log, thumbNail: thumbNail),
        SizedBox(width:log.cType == 'USER'
            ? 0 : WidgetSize(context).sizedBox13,),
        Padding(
          padding: EdgeInsets.only(
              top: log.cType == 'USER'
                  ? 0 : WidgetSize(context).chatBoxPadding
          ),
          child: Row(
            children: [
              RippleImageButton(
                borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox15),
                  image:  ClipRRect(
                    borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox15),
                    child:
                    OutImageBinder(
                        imageWidth: imageWidth,
                        imageHeight: (imageWidth*imageInfo.height)/imageInfo.width,
                        imageUrl: '${ApiConsole.imageChatBananaUrl}${imageInfo.imageUrl}',
                        errUrl: AppElement.defaultStore,
                        imageLabel: 'other'
                    ),
                    // ImageProviderStateChat(
                    //   imageNetworkUrl: '${ApiConsole.imageChatBananaUrl}${chatIamgeInfoFromJson(log.cMessage).imageUrl}'
                    //
                    //   ApiConsole.imageChatBananaUrl+log.cMessage,
                    //   errortAssetUrl: AppElement.defaultStore,
                    //   fit: BoxFit.fill, widgetWidth1: WidgetSize(context).width038,
                    //   widgetWidth2: WidgetSize(context).width057,
                    // ),
                  ),
                onTap: (){
                  imageDialogManager.openImageDownLoad(routerContext: context,
                      baseUrl: ApiConsole.imageChatBananaUrl,
                      imageUrl: imageInfo.imageUrl, isDownload: true);
                },
              )

              // ClipRRect(
              //   borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox15),
              //   child:
              //
              //
              //
              //   GestureDetector(
              //     onTap: (){
              //       ImageDialogManager().openImageDownLoad(routerContext: context, imageUrl: log.cMessage, isDownload: true);
              //     },
              //     child: ImageProviderStateChat(
              //       imageNetworkUrl: ApiConsole.imageBananaUrl+log.cMessage,
              //       errortAssetUrl: AppElement.defaultStore,
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
