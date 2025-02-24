import 'package:flutter/material.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class QuitCaseNumberText extends StatelessWidget {
  final String text;
  const QuitCaseNumberText({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('-  ',
              style: TextStyle(
                  fontSize: WidgetSize(context).sizedBox14,
                  fontWeight: FontWeight.w400,
                  color: Style.blackWrite
              ),
            ),
            Expanded(
              child: Text(text,
                style: TextStyle(
                    fontSize: WidgetSize(context).sizedBox14,
                    fontWeight: FontWeight.w400,
                    color: Style.blackWrite
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: WidgetSize(context).sizedBox3,)
      ],
    );
  }
}
