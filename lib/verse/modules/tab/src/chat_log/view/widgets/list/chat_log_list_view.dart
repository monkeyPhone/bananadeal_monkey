import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_image_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/widgets/list/type/chat_log_list_type_accept_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/widgets/list/type/chat_log_list_type_image_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/widgets/list/type/chat_log_list_type_invite_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/widgets/list/type/chat_log_list_type_leave_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/widgets/list/type/chat_log_list_type_message_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChatLogListView extends StatelessWidget {
  final int index;
  final List<ChatLogDto> show;
  const ChatLogListView({super.key,
    required this.index,
    required this.show
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CheckDay(
          route: index == show.length-1 || DateTime.parse(show[index].cRegdate).toLocal().day != DateTime.parse(show[index+1].cRegdate).toLocal().day,
          regdate: show[index].cRegdate,
          isDate: true,
        ),
        _CheckDay(
            route: index != show.length-1 && (DateTime.parse(show[index].cRegdate).toLocal().day == DateTime.parse(show[index+1].cRegdate).toLocal().day) &&  show[index].cIsRead != show[index+1].cIsRead
                && show[index+1].cIsRead == 'Y',
            regdate: '여기까지 읽으셨습니다'
        ),
        _ChatRouteCase(chatLog: show[index],)
      ],
    );
  }
}


class _CheckDay extends StatelessWidget {
  final bool route;
  final String regdate;
  final bool? isDate;
  const _CheckDay({
    required this.route,
    required this.regdate,
    this.isDate,
  });

  @override
  Widget build(BuildContext context) {
    return route
        ? _ChatLogCheckDay(regdate: regdate, isDate: isDate,)
        : const SizedBox();
  }
}


class _ChatLogCheckDay extends StatelessWidget {
  final String regdate;
  final bool? isDate;
  const _ChatLogCheckDay({
    required this.regdate,
    required this.isDate
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Stack(
      children: [
        SizedBox(
          width: size.widthCommon,
          height: size.sign2w1+size.sized32grid,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: isDate != null ? EdgeInsets.only(
                    top: size.sized16grid,
                    bottom:  size.sized16grid) :  EdgeInsets.only(bottom:  size.sized32grid),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: size.sizedBox1_5,
                          color: isDate == true ? grey999999 : greyEAEAEA,
                        )
                    )
                ),
                height: size.sizedBox26,
                width: size.widthCommon,
              ),

            ],
          ),
        ),
        Positioned.fill(
            child: Center(
              child: Container(
                padding:
                isDate == true ? EdgeInsets.symmetric(horizontal: size.sizedBox8)
                    : EdgeInsets.symmetric(horizontal: size.sizedBox18 ,vertical: size.sizedBox6),
                decoration: BoxDecoration(
                    color:  isDate == true ? greyEAEAEA : Colors.black26,
                    borderRadius: BorderRadius.circular(isDate == true ? 0 : size.sizedBox12)
                ),
                child: Text(
                  isDate == true
                      ?
                  DateFormat('yyyy년 MM월 dd일').format(DateTime.parse(regdate).toLocal())
                      : regdate
                  ,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: size.sizedBox14,
                      color: isDate == true ? grey999999 : white
                  ),
                ),
              ),
            )
        )
      ],
    );
  }
}


class _ChatRouteCase extends StatelessWidget {
  final ChatLogDto chatLog;
  const _ChatRouteCase({
    required this.chatLog,
  });

  @override
  Widget build(BuildContext context) {
    return chatLog.cMessage.contains('SEND/DEAL/ACCEPT')
            ? ChatLogListTypeAcceptView(chatLog: chatLog,)   // 이벤트 아직 안넣음.
            : chatLog.cMessage.contains('UPLOAD/IMAGES/')
               ? ChatLogListTypeImageView(chatLog: chatLog, imageDto: chatImageDtoFromJson(chatLog.cMessage),)
               : chatLog.cMessage.contains('SEND/DEAL/INVITATION')
                  ? const ChatLogListTypeInviteView()
                  : chatLog.cMessage.contains('님이 채팅을 종료했어요')
                     ? const ChatLogListTypeLeaveView()
                     : ChatLogListTypeMessageView(chatLog: chatLog,);
  }
}

