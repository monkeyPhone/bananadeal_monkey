import 'package:flutter/material.dart';

import '../../../../../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../../../../../css/size.dart';

class RateSortBarButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Color boxColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  const RateSortBarButton({
    super.key,
    required this.onTap,
    required this.boxColor,
    required this.borderColor,
    required this.text,
    required this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: onTap,
        margin: EdgeInsets.only(right: WidgetSize(context).width00234),
        color: boxColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
            color: borderColor,
            width: WidgetSize(context).width00025
        ),
        padding: EdgeInsets.symmetric(
            horizontal: WidgetSize(context).sizedBox16,
            vertical: WidgetSize(context).width002),

        widget: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: WidgetSize(context).sizedBox14,
                  fontWeight: FontWeight.w400,
                  color: textColor),
            )
        )
    );
  }
}
