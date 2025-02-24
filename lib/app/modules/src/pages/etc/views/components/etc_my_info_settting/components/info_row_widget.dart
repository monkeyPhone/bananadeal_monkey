import 'package:flutter/material.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class InfoRowWidget extends StatelessWidget {
  final Widget row;
  const InfoRowWidget({
    required this.row,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: WidgetSize(context).paddingBodyWhole,
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).height60px,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: WidgetSize(context).sizedBox1,
                  color: Style.greyDDDDDD
              )
          )
      ),
      child: row,
    );
  }
}
