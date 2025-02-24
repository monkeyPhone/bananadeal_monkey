import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_user_chat_list.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_image/chat_send_image_row/chat_send_image_row_case_store_regdate.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_image/chat_send_image_row/chat_send_image_row_case_user_regdate.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_send_image/chat_send_image_row/image_area/chat_send_image_row_thumbnail.dart';
import 'package:flutter/material.dart';

class ChatLogImageError extends StatelessWidget {
  final ChatLogList log;
  final String thumbNail;
  const ChatLogImageError({super.key,
    required this.log,
    required this.thumbNail
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WidgetSize(context).widthCommon,
      margin: EdgeInsets.only(bottom: WidgetSize(context).sizedBox28),
      child:  Row(
        mainAxisAlignment:
        log.cType  == 'USER'
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ChatSendImageRowCaseUserRegdate(log: log),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChatSendImageRowThumbnail(log: log, thumbNail: thumbNail),
              SizedBox(width: WidgetSize(context).sizedBox13,),
              Padding(
                padding: EdgeInsets.only(
                    top: log.cType == 'USER'
                        ? 0 : WidgetSize(context).chatBoxPadding
                ),
                child: Row(
                  children: [
                    Container(
                      height: WidgetSize(context).width038, width:WidgetSize(context).width057,
                      decoration: BoxDecoration(
                        color: Style.greyD9D9D9,
                        borderRadius:  BorderRadius.circular(WidgetSize(context).sizedBox15),
                      ),
                      padding: EdgeInsets.symmetric( horizontal:  WidgetSize(context).sizedBox16,),
                      child: Center(child: Text('이미지를 불러오지 못했습니다.', style: TextStyle(fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w500),)),
                    ),

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
          ),
          ChatSendImageRowCaseStoreRegdate(log: log, )
        ],
      ),
    );
  }
}
