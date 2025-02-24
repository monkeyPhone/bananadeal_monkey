import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/manager/chat_log_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ComponentChatLogThumbnail extends StatelessWidget {
  final ChatLogDto chatLog;
  const ComponentChatLogThumbnail({super.key,
    required this.chatLog
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return chatLog.cType== 'USER'
        ? const SizedBox()
        : GestureDetector(
      onTap: (){
        context.read<ChatLogManager>().gotoStoreDetailView(context);
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child:  BdImageBinder(
              imageHeight: size.sizedBox50,
              imageWidth: size.sizedBox50,
              imageUrl: '${context.read<VerseConfig>().url.imageBananaUrl}${context.read<ChatLogManager>().room.smPathImg0}',
              errUrl: defaultStore,
              imageLabel: caseThumb
          )

      ),
    );
  }
}
