import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';

class InviteDealCheckOn extends StatelessWidget {
  const InviteDealCheckOn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(WidgetSize(context).sizedBox2*2),
      height: WidgetSize(context).sizedBox28,
      width: WidgetSize(context).sizedBox28,
      color: Style.yellow,
      child: Image.asset(AppElement.checkImage,
        height: WidgetSize(context).sizedBox20, width: WidgetSize(context).sizedBox20,color: Style.white,
      ),
    );
  }
}
