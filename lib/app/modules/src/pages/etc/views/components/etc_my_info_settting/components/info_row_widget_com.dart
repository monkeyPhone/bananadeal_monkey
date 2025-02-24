import 'package:flutter/material.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class InfoRowWidgetCom extends StatelessWidget {
  final String text1;
  final String? text2;
  final Widget? button;
  const InfoRowWidgetCom({
    required this.text1,
    this.text2,
    this.button,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: WidgetSize(context).sizedBox18,
            fontWeight: FontWeight.w700,
            color: Style.blackWrite,
          ),
        ),
        text2 != null
            ?  Text(
                  text2!,
                  style: TextStyle(
                    fontSize: WidgetSize(context).sizedBox18,
                    fontWeight: FontWeight.w700,
                    color: Style.blackWrite,
                  ),
               )
            : button ?? const SizedBox(),
      ],
    );
  }
}
