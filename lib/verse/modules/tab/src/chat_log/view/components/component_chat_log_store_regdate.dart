import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ComponentChatLogStoreRegdate extends StatelessWidget {
  final ChatLogDto chatLog;
  const ComponentChatLogStoreRegdate({super.key,
    required this.chatLog
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return chatLog.cType  != 'USER'
        ?  Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.sizedBox8,),
          child: Text( DateFormat('HH:mm').format(DateTime.parse(chatLog.cRegdate).toLocal()),
            style: TextStyle(fontSize: size.sizedBox10, fontWeight: FontWeight.w400, color: grey999999),
          ),
        ),
      ],
    )
        :  const SizedBox();
  }
}
