import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign1/widgets/helper/sign1_main_area/sign1_case_area/sign1_empty.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../routes/const_element.dart';

class Sign1SwitchWidget extends StatelessWidget {
  final String caseString;
  const Sign1SwitchWidget({
    required this.caseString,
    super.key});

  @override
  Widget build(BuildContext context) {
    switch(caseString){
      case AppElement.statusEmpty:
        return Sign1Empty();
      case AppElement.statusLoading:
        return Center(
          child: CircularProgressIndicator(
            color: Style.progressBar,
          ),
        );
      default:
        return Sign1Empty();
    }
  }
}
