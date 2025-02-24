import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/chat/manager/chat_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListTileView extends StatelessWidget {
  final ChatRoomVO room;
  const ChatListTileView({super.key,
    required this.room
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdRippleButtonBasic(
        onTap: () async{
          await context.read<ChatManager>().gotoChatLogView(
              context: context,
              room: room
          );
        },
        padding: EdgeInsets.symmetric(horizontal: size.sized16grid,),
        inerMargin: EdgeInsets.symmetric(vertical: size.sized20grid),
        outBorder: Border(
            bottom: BorderSide(
                width: size.sizedBox0_5,
                color: greyD7D7D7)),
        width: size.widthCommon,
        height: size.ratio58_3,
        child: Stack(
          children: [
            Row(
              children: [
                _ThumbNail(
                  url:'${context.read<VerseConfig>().url.imageBananaUrl}${room.smPathImg0}',
                  status: room.crStatus,
                ),
                const BdCustomPad(padEnum: PadEnum.width16),
                Expanded(
                    child: _Message(
                      storeName: room.smStoreName,
                      lastMessage: room.lastMessage,
                      lastTime: room.lastMessageTime,
                      crStatus: room.crStatus,
                    )
                ),
                const BdCustomPad(padEnum: PadEnum.width16),
                _TimeLineBadge(
                  lastTime: room.lastMessageTime,
                  crStatus: room.crStatus,
                  cIsRead: room.cIsRead,
                )
              ],
            )
          ],
        )
    );
  }
}


class _ThumbNail extends StatelessWidget {
  final String url;
  final String status;
  const _ThumbNail({
    required this.url,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    final BorderRadiusGeometry borderRadius = BorderRadius.circular(999);
    return _FittedBox(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(
              width: size.sizedBox1,
              color: greyC4C4C4
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: borderRadius,
              child: BdImageBinder(
                  imageWidth: size.ratio58_3,
                  imageHeight: size.ratio58_3,
                  imageUrl: url,
                  errUrl: defaultStore,
                  imageLabel: caseThumb
              ),
            ),
            Positioned.fill(
                child:
                status != 'NORMAL'
                    ?
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('대화', style: TextStyle(color: white, fontSize: size.sizedBox12, fontWeight: FontWeight.w700),),
                      SizedBox(
                        height: size.sizedBox3,
                      ),
                      Text('종료', style: TextStyle(color: white, fontSize: size.sizedBox12, fontWeight: FontWeight.w700),),
                    ],
                  ),
                )
                    : const SizedBox()
            )
          ],
        ),
      ),
    );
  }
}


class _Message extends StatelessWidget {
  final String storeName;
  final String lastMessage;
  final String lastTime;
  final String crStatus;
  const _Message({
    required this.storeName,
    required this.lastMessage,
    required this.lastTime,
    required this.crStatus,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          storeName == ''
              ? '알 수 없음'
              : storeName,
          style: TextStyle(
            fontSize: size.body,
            color: crStatus == 'NORMAL'
                ? bananaBack
                : greyAAAAAA,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          context.read<VerseConfig>().function.chatConvertType(chat: lastMessage, time: lastTime),
          style: TextStyle(
            fontSize: size.sub,
            color: crStatus == 'NORMAL'
                ? bananaBack
                : greyAAAAAA,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,

        )
      ],
    );
  }
}


class _TimeLineBadge extends StatelessWidget {
  final String lastTime;
  final String crStatus;
  final int cIsRead;
  const _TimeLineBadge({
    required this.lastTime,
    required this.crStatus,
    required this.cIsRead
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SizedBox(
      height: size.ratio58_3,
      width: size.ratio58_3,
      child: Column(
        children: [
          Expanded(
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    lastTime == '' ? ' ':
                    context.read<VerseConfig>().function.chatTimeLine(lastTime),
                    style: TextStyle(
                        fontSize: size.sizedBox16,
                        color: crStatus == 'NORMAL' ? grey999999 : greyAAAAAA,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              )
          ),
          const BdCustomPad(padEnum: PadEnum.height2),
          Expanded(
              child: Center(
                child: cIsRead == 0
                    ? const SizedBox()
                    : FittedBox(
                  fit: BoxFit.fitHeight,
                  child:  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.sizedBox9_5,
                          vertical: size.etc012
                      ),
                      decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          cIsRead >= 100 ? '99+' : '$cIsRead',
                          style: TextStyle(
                              fontSize: size.sizedBox14,
                              color: brown),
                        ),
                      )
                  ),
                ),
              )
          )

        ],
      ),
    );
  }
}



class _FittedBox extends StatelessWidget {
  final Widget child;
  const _FittedBox({required this.child});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: child,
    );
  }
}
