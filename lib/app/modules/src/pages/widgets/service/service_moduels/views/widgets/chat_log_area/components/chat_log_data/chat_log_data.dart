import 'package:banana_deal_by_monkeycompany/app/managers/image/image_dialog_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/chat_route_case.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/views/widgets/chat_log_area/components/chat_log_data/chat_log_type/day/check_day_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../service_model/chat_user_chat_list.dart';

class ChatLogData extends GetView<ChatLogController> {
  final int index;
  final List<ChatLogList> log;
  final ImageDialogManager imageDialogManager;
  final String thumbNail;
  const ChatLogData({Key? key,
    required this.index,
    required this.log,
    required this.imageDialogManager,
    required this.thumbNail
  }) : super(key: key
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
      child: SizedBox(
          width: WidgetSize(context).widthCommon,
          child: Column(
            children: [
              _CheckDate(
                log: log,
                index: index,
              ),
              _CheckIsRead(
                log: log,
                index: index,
              ),
              ChatRouteCase(
                imageDialogManager: imageDialogManager,
                thumbNail: thumbNail,
                log: log[index],
              )
            ],
          )
      ),
    );
  }
}


class _CheckDate extends StatelessWidget {
  final int index;
  final List<ChatLogList> log;
  const _CheckDate({
    required this.index,
    required this.log,
  });

  @override
  Widget build(BuildContext context) {
    try{
      return  index == log.length-1
                ?  log[index].cRegdate == ''
                    ? SizedBox()
                    : CheckDayRoute(
                        route: true,
                        regdate: log[index].cRegdate,
                        isDate: true,
                      )
                :  log[index].cRegdate == '' ||  log[index+1].cRegdate == ''
                    ? SizedBox()
                    : CheckDayRoute(
                        route: (DateTime.parse(log[index].cRegdate).toLocal().day != DateTime.parse(log[index+1].cRegdate).toLocal().day),
                        regdate: log[index].cRegdate,
                        isDate: true,
      );
    } catch(_){
      return SizedBox();
    }
  }
}

class _CheckIsRead extends StatelessWidget {
  final int index;
  final List<ChatLogList> log;
  const _CheckIsRead({
    required this.index,
    required this.log,
  });

  @override
  Widget build(BuildContext context) {
   try{
     return log[index].cRegdate == '' ||  log[index+1].cRegdate == '' || log[index].cType == 'USER'
         ? SizedBox()
         :
     CheckDayRoute(
         route:
         (DateTime.parse(log[index].cRegdate).toLocal().day == DateTime.parse(log[index+1].cRegdate).toLocal().day) &&  log[index].cIsRead != log[index+1].cIsRead
             && log[index+1].cIsRead == 'Y',
         regdate: '여기까지 읽으셨습니다'
     );
   } catch(_){
     return SizedBox();
   }

   }
}

