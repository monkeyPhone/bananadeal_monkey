import 'package:flutter/material.dart';

import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';

class ExPlainColumn extends StatelessWidget {
  final Widget child;
  const ExPlainColumn({
    required this.child,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: WidgetSize(context).sizedBox20),
      decoration: BoxDecoration(
        color: Style.white,
        border: Border(
          bottom: BorderSide(color: Style.greyDDDDDD, width: WidgetSize(context).sizedBox1_5),
        )
      ),
      child: child,
    );
  }
}
