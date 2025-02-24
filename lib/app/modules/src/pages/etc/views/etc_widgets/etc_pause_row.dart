import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/etc_widgets/etc_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../css/size.dart';
import 'etc_pad.dart';

class EtcPauseRow extends StatelessWidget {
  final String text1;
  final String text2;
  final Color? color;
  const EtcPauseRow({
    required this.text1,
    required this.text2,
    this.color,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EtcPauseText1(text: text1),
            SizedBox(
              width: WidgetSize(context).sizedBox5,
            ),
            EtcPauseText2(text: text2, color: color)
          ],
        ),
        EtcPad(),
      ],
    );
  }
}
