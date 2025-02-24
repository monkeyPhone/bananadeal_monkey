import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:flutter/material.dart';

class InviteDealCheckOff extends StatelessWidget {
  const InviteDealCheckOff({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(WidgetSize(context).sizedBox2*2),
      height: WidgetSize(context).sizedBox28,
      width: WidgetSize(context).sizedBox28,
      decoration: BoxDecoration(
          color: Style.white,
          border: Border.all(width: WidgetSize(context).sizedBox1, color: Style.greyAAAAAA)
      ),
    );
  }
}
