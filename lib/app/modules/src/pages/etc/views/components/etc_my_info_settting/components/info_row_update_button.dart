import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class InfoRowUpdateButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final double? width;
  final double? height;
  final String text;
  const InfoRowUpdateButton({
    required this.onTap,
    this.width,
    this.height,
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: onTap,
        color: Style.yellow,
        borderRadius: BorderRadius.circular(999),
        width: width,
        height: height,
        widget: Center(
          child: Text(text, style: TextStyle(
              color: Style.brown, fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w400
          ),),
        )
    );
  }
}
