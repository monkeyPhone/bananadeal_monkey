import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/deal_active/helper/deal_active_scroll_member/helper/deal_active_item_deal.dart';
import 'package:flutter/material.dart';

class DealActiveListViewColumnLast extends StatelessWidget {
  final int index;
  final bool titleBool;
  final String imageurl;
  final String name;
  final String msg;
  final String time;
  const DealActiveListViewColumnLast({
    required this.index,
    required this.titleBool,
    required this.imageurl,
    required this.name,
    required this.msg,
    required this.time,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  titleBool
              ? const SizedBox()
              : DealActiveItemDeal(
                    imageurl: imageurl,
                    name: name,
                    msg: msg,
                    time: time
    );
  }
}

