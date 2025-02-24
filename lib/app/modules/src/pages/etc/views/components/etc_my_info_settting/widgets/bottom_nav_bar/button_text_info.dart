import 'package:flutter/material.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class ButtonTextInfo extends StatelessWidget {
  final String text;
  const ButtonTextInfo({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Style.grey999999,
                  width: WidgetSize(context).sizedBox1_5
              )
          )
      ),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: WidgetSize(context).sizedBox3
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: WidgetSize(context).sizedBox18,
            fontWeight: FontWeight.w700,
            color: Style.grey999999,
          ),
        ),
      ),
    );
  }
}
