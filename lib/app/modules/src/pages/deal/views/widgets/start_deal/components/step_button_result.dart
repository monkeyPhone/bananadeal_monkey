import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../css/size.dart';

class StepButtonResult extends StatelessWidget {
  final GestureTapCallback onTap;
  final Color buttonColor;
  final String buttonText;
  final Color buttonTextColor;
  const StepButtonResult({
    required this.onTap,
    required this.buttonColor,
    required this.buttonText,
    required this.buttonTextColor,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: WidgetSize(context).sizedBox16),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(WidgetSize(context).widthCommon),
        ),
        height: WidgetSize(context).height60px,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: WidgetSize(context).sizedBox18,
                color: buttonTextColor,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
