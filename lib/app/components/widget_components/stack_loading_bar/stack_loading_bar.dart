import 'package:flutter/material.dart';

import '../../../css/size.dart';
import '../../../css/style.dart';

class StackLoadingBar extends StatelessWidget {
  const StackLoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).sizedBox24,
      height: WidgetSize(context).sizedBox24,
      child: CircularProgressIndicator(
        color: Style.progressBar,
      ),
    );
  }
}
