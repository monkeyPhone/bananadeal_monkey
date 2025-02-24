import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/etc_active/helper/etc_active_item_etc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../css/size.dart';

class EtcActiveColumn extends StatelessWidget {
  final int index;
  final bool timeBool;
  final String imageUrl;
  final String title;
  final String msg;
  final String time;
  const EtcActiveColumn({
    required this.index,
    required this.timeBool,
    required this.imageUrl,
    required this.title,
    required this.msg,
    required this.time,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        timeBool
            ? Column(
                children: [
                  _padHeight(context),
                  Text('${DateFormat("yyyy년 MM월 dd일").format(DateTime.parse(time))} 알림', style: TextStyle(fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox18),),
                  _padHeight2(context)
                ],
              )
            : const SizedBox(),
        EtcActiveItemEtc(
            imageUrl: imageUrl,
            title: title,
            msg: msg,
            time: time
        ),
      ],
    );
  }

  Widget _padHeight(BuildContext context){
    return SizedBox(
      height: WidgetSize(context).sizedBox15,
    );
  }

  Widget _padHeight2(BuildContext context){
    return SizedBox(
      height: WidgetSize(context).sizedBox8,
    );
  }

}
