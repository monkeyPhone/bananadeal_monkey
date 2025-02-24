import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:flutter/material.dart';

class CommonCustomTextDot extends StatelessWidget {
  const CommonCustomTextDot({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal:  WidgetSize(context).sizedBox18),
      child: Text('@', style: TextStyle(fontSize: WidgetSize(context).sizedBox18, fontWeight: FontWeight.w400),),
    );
  }
}
