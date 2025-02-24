import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/deal_active/helper/deal_active_scroll_member/deal_active_list_view_column_container/deal_active_list_view_column_container.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/deal_active/helper/deal_active_scroll_member/deal_active_list_view_column_last.dart';
import 'package:flutter/material.dart';

class DealActiveListViewColumn extends StatelessWidget {
  final int index;
  final bool titleBool;
  final bool elementBool;
  final String imageurl;
  final String name;
  final String originName;
  final String msg;
  final String time;
  const DealActiveListViewColumn({
    required this.index,
    required this.titleBool,
    required this.elementBool,
    required this.imageurl,
    required this.name,
    required this.originName,
    required this.msg,
    required this.time,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DealActiveListViewColumnContainer(titleBool: titleBool, elementBool: elementBool, name: originName),
        DealActiveListViewColumnLast(index: index, titleBool: titleBool, imageurl: imageurl, name: name, msg: msg,time: time,)
      ],
    );
  }
}
