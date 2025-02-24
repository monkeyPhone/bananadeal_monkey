import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../css/size.dart';

class StepButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Color buttonColor;
  final Color buttonBorderColor;
  final Widget check;
  final String buttonText;
  final String? buttonText2;
  final Color buttonTextColor;
  const StepButton({
    required this.onTap,
    required this.buttonColor,
    required this.buttonBorderColor,
    required this.check,
    required this.buttonText,
    this.buttonText2='',
    required this.buttonTextColor,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: onTap,
        color: buttonColor,
        borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
        border: Border.all(
          width: WidgetSize(context).sizedBox2,
          color: buttonBorderColor,
        ),
        padding: EdgeInsets.only(left: WidgetSize(context).sizedBox16),
        height: WidgetSize(context).sizedBox70,
        widget: Row(
          children: [
            check,
            SizedBox(
              width: WidgetSize(context).sizedBox8,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '$buttonText ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: buttonTextColor,
                          fontSize: WidgetSize(context).sizedBox18,
                        ),
                      ),
                    ),
                    Text(
                      buttonText2!,
                      style: TextStyle(
                          fontSize: WidgetSize(context).sizedBox14,
                          color: buttonTextColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: WidgetSize(context).sizedBox16,
            ),
          ],
        )
    );
  }


}
