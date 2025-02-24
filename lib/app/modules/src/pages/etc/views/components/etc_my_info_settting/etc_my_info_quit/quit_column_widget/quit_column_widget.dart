import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/etc_my_info_quit/quit_column_widget/quit_case_number1.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/etc_my_info_quit/quit_column_widget/quit_case_number_0.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class QuitColumnWidget extends StatelessWidget {
  final String text;
  final int caseNumber;
  const QuitColumnWidget({
    required this.text,
    required this.caseNumber,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: WidgetSize(context).sizedBox8,
        ),
        Text(
          text,
          style: TextStyle(
              color: Style.brown,
              fontWeight: FontWeight.w700,
              fontSize: WidgetSize(context).sizedBox18
          ),
        ),
        SizedBox(
          height: WidgetSize(context).sizedBox8,
        ),
        caseNumber == 0
            ? QuitCaseNumber0()
            : QuitCaseNumber1()
      ],
    );
  }
}
