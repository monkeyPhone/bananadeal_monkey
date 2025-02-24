import 'package:flutter/material.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class EstimateFirstView extends StatelessWidget {
  const EstimateFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('해당 페이지를 다시 열어주세요.',
        style: TextStyle(
            fontSize: WidgetSize(context).sizedBox18,
            fontWeight: FontWeight.w700,
            color: Style.ultimateGrey
        ),
      ),
    );;
  }
}
