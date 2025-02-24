import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../css/size.dart';

class SearchPhoneSortButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Color boxColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  const SearchPhoneSortButton({
    required this.onTap,
    required this.boxColor,
    required this.borderColor,
    required this.text,
    required this.textColor,
    super.key});

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        margin: EdgeInsets.only(right: WidgetSize(context).sizedBox10),
        padding: EdgeInsets.symmetric(
            horizontal: WidgetSize(context).sizedBox16,
            vertical: WidgetSize(context).sizedBox9),
        color: boxColor,
        border: Border.all(
            color: borderColor,
            width: WidgetSize(context).sizedBox1),
        height: WidgetSize(context).sizedBox37,
        widget: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: WidgetSize(context).sizedBox14,
                fontWeight: FontWeight.w400,
                color: textColor),
          ),
        )
    );
  }
}
