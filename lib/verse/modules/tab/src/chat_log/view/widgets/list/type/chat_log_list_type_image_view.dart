import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_image_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/manager/chat_log_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/components/component_chat_log_store_regdate.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/components/component_chat_log_thumbnail.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/components/component_chat_log_user_regdate.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_stack.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatLogListTypeImageView extends StatelessWidget {
  final ChatLogDto chatLog;
  final ChatImageDto imageDto;
  const ChatLogListTypeImageView({super.key,
    required this.imageDto,
    required this.chatLog
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    try{
      return Container(
        width: size.widthCommon,
        margin: EdgeInsets.only(bottom: size.sizedBox28),
        child: _ChatImageRow(
          chatLog: chatLog,
          imageWidth: imageDto.width <= imageDto.height ?  size.width038 : size.width057,
          imageDto: imageDto,
        ),
      );
    }catch(_){
      return const SizedBox();
    }
  }
}

class _ChatImageRow extends StatelessWidget {
  final ChatLogDto chatLog;
  final ChatImageDto imageDto;
  final double imageWidth;
  const _ChatImageRow({
    required this.chatLog,
    required this.imageDto,
    required this.imageWidth
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      chatLog.cType  == 'USER'
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ComponentChatLogUserRegdate(chatLog: chatLog),
        _ImageArea(
          imageDto: imageDto,
          imageWidth: imageWidth,
          chatLog: chatLog,
        ),
        ComponentChatLogStoreRegdate(chatLog: chatLog)
      ],
    );
  }
}


class _ImageArea extends StatelessWidget {
  final ChatLogDto chatLog;
  final ChatImageDto imageDto;
  final double imageWidth;
  const _ImageArea({
    required this.chatLog,
    required this.imageDto,
    required this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ComponentChatLogThumbnail(chatLog: chatLog),
        const BdCustomPad(padEnum: PadEnum.width12),
        Padding(
          padding: EdgeInsets.only(
              top: chatLog.cType == 'USER'
                  ? 0 : size.chatBoxPadding
          ),
          child: Row(
            children: [
              BdRippleButtonStack(
                borderRadius: BorderRadius.circular(size.sizedBox15),
                onTap: () async{
                  List<String> imageList = await context.read<ChatLogManager>().getImageList(context);
                  if(context.mounted){
                    if(imageList.isNotEmpty){
                      ChatImageDto currentImage = chatImageDtoFromJson(chatLog.cMessage);
                      int currentIndex = imageList.indexOf('${context.read<VerseConfig>().url.bananaChat}${currentImage.imageUrl}');
                      context.read<VerseConfig>().browser.image.openDialog(
                          routerContext: context,
                          currentIndex: currentIndex,
                          imageList: imageList,
                          isDownload: true,
                          baseUrl: ''
                      );
                    }
                    else{
                      context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '이미지 정보를 불러올 수 없습니다.');
                    }

                  }
                }, isDelay: true,
                child:  ClipRRect(
                  borderRadius: BorderRadius.circular(size.sizedBox15),
                  child:
                  BdImageBinder(
                      imageWidth: imageWidth,
                      imageHeight: (imageWidth*imageDto.height)/imageDto.width,
                      imageUrl: '${context.read<VerseConfig>().url.bananaChat}${imageDto.imageUrl}',
                      errUrl: defaultStore,
                      imageLabel: 'other'
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}


