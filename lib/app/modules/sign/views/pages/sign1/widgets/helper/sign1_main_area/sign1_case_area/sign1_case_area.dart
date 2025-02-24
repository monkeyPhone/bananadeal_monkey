import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign1/widgets/helper/sign1_main_area/sign1_case_area/sign1_switch_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class Sign1CaseArea extends StatelessWidget {
  final String caseString;
  const Sign1CaseArea({
    required this.caseString,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: WidgetSize(context).sizedBox16),
      decoration: BoxDecoration(
          color: Style.white,
          border: Border(
              top: BorderSide(width: WidgetSize(context).sizedBox2, color: Style.karajeck),
              bottom: BorderSide(width: WidgetSize(context).sizedBox2, color: Style.karajeck)
          )
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox5)),
          child: Sign1SwitchWidget(caseString: caseString)
      ),
    );
  }
}
