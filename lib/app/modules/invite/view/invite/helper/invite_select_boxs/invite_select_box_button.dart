import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/controller/invite_deal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InviteSelectBoxButton extends GetView<InviteDealController> {
  final int index;
  const InviteSelectBoxButton({
    required this.index,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (select)=> Container(
          padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox10, vertical: WidgetSize(context).sizedBox7_5),
          margin: EdgeInsets.only(right: index == 0 ?  WidgetSize(context).sizedBox12 : 0),
          decoration: select.value == index
              ? BoxDecoration(
              borderRadius: BorderRadius.circular(WidgetSize(context).widthCommon),
              color: Style.yellow
          )
              : BoxDecoration(
              borderRadius: BorderRadius.circular(WidgetSize(context).widthCommon),
              border: Border.all(
                  color: Style.yellow,
                  width: WidgetSize(context).sizedBox1_5
              )
          ),
          child: Center(
            child: Text(index == 0 ? '전체선택' : '전체해제', style: TextStyle(color: Style.brown, fontWeight: FontWeight.w400, fontSize: WidgetSize(context).sizedBox14),),
          ),
        )
        ,controller.selected);
  }
}
