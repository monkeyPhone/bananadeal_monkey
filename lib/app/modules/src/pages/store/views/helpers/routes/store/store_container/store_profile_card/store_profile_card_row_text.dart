import 'package:flutter/material.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';


class StoreProfileCardRowText extends StatelessWidget {
  final String text;
  final String text2;
  final Widget icon;
  const StoreProfileCardRowText({
    required this.text,
    required this.text2,
    required this.icon,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: WidgetSize(context).sizedBox14,
              color: Style.greyTextButton
          ),
        ),
        SizedBox(width: WidgetSize(context).sizedBox6_5,),
        icon,
        Text(text2,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: WidgetSize(context).sizedBox14,
              color: Style.blackWrite
          ),
        ),
      ],
    );
  }
}
