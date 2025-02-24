import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/components/component_chat_log_store_regdate.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/components/component_chat_log_thumbnail.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/components/component_chat_log_user_regdate.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatLogListTypeMessageView extends StatelessWidget {
  final ChatLogDto chatLog;
  const ChatLogListTypeMessageView({super.key,
    required this.chatLog
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      margin: EdgeInsets.only(bottom: size.sizedBox28),
      child:  Row(
        mainAxisAlignment:
        chatLog.cType == 'USER'
            ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ComponentChatLogThumbnail(chatLog: chatLog),
          Padding(
            padding: EdgeInsets.only(
                top: chatLog.cType == 'USER'
                    ? 0 : size.chatBoxPadding
            ),
            child: _ChatMessageArea(
              chatLog: chatLog,
              pad: chatLog.cType == 'USER'
                  ? size.etc01 : 0,
              pad2: chatLog.cType == 'USER'
                  ? 0 : size.etc01,
              maxWidth: chatLog.cType == 'USER'
                  ? size.chatMaxWidth075
                  : size.chatMaxWidth065,
              cColor: chatLog.cType == 'USER'
                  ? yellow : white,
            ),
          )
        ],
      ),
    );
  }
}


class _ChatMessageArea extends StatelessWidget {
  final ChatLogDto chatLog;
  final double pad;
  final double pad2;
  final double maxWidth;
  final Color cColor;
  const _ChatMessageArea({
    required this.chatLog,
    required this.pad,
    required this.pad2,
    required this.maxWidth,
    required this.cColor,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const BdCustomPad(padEnum: PadEnum.width8),
        ComponentChatLogUserRegdate(chatLog: chatLog,),
        SizedBox(width: pad,),
        Container(
          constraints: BoxConstraints(
              minHeight: size.etc08,
              maxHeight: double.infinity,
              maxWidth: maxWidth
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.sizedBox14),
              color: cColor
          ),
          padding: EdgeInsets.symmetric(horizontal: size.sizedBox12, vertical: size.sizedBox12,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(chatLog.cMessage,
                style: TextStyle(fontSize: size.sub, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        SizedBox(
            width: pad2
        ),
        ComponentChatLogStoreRegdate(chatLog:chatLog)
      ],
    );
  }
}
