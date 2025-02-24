import 'package:flutter/material.dart';

import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';

class EtcDivider extends StatelessWidget {
  const EtcDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.greyF4F4F4,
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).sizedBox8,
    );
  }
}
