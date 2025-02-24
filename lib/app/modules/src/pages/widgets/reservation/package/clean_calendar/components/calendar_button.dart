import 'package:flutter/material.dart';
import '../../../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../../../css/size.dart';


class CalendarButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String buttonText;
  final Color backGroundColor;
  final Color borderColor;
  const CalendarButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.backGroundColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
      color: backGroundColor,
      onTap: onTap,
      widget: Center(
          child: Text(buttonText,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: WidgetSize(context).sizedBox17
            ),
          )
      ),
      borderRadius: BorderRadius.circular(999),
      border: Border.all(
          width: WidgetSize(context).sizedBox1_5,
          color: borderColor
      ),
    );
  }
}
