import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../service_model/chat_user_chat_list.dart';

class ChatSendImageRowCaseStoreRegdate extends StatelessWidget {
  final ChatLogList log;
  const ChatSendImageRowCaseStoreRegdate({
    required this.log,
    super.key});

  @override
  Widget build(BuildContext context) {
    return log.cType  != 'USER'
            ?  Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: WidgetSize(context).sizedBox8,),
                    child:
                    log.cRegdate == ''
                        ? SizedBox()
                        :
                    Text( DateFormat('HH:mm').format(DateTime.parse('${
                        log.cRegdate
                    }').toLocal()),
                      style: TextStyle(fontSize: WidgetSize(context).sizedBox10, fontWeight: FontWeight.w400, color: Style.grey999999),
                    ),
                  ),
                ],
              )
           :  SizedBox();
  }
}
