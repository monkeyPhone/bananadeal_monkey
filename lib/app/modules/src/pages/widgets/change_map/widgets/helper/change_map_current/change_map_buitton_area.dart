import 'package:flutter/material.dart';

import '../../../../../../../../css/size.dart';
import '../../button_area.dart';

class ChangeMapButtonArea extends StatelessWidget {
  final BuildContext mediaContext;
  const ChangeMapButtonArea({
    required this.mediaContext,
    super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(mediaContext).viewInsets.bottom > 0
        ? SizedBox()
        :
    Padding(
      padding: WidgetSize(context).paddingBodyWhole,
      child: ButtonArea(),
    );
  }
}
