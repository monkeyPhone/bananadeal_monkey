import 'package:flutter/material.dart';
import '../../../../../../css/size.dart';
import '../../permission_text_widget.dart';

class PermissionColumnTitle extends StatelessWidget {
  final String title;
  final String sub;
  final IconData iconMain;
  final Color? mainIconColor;
  const PermissionColumnTitle({
    required this.title,
    required this.sub,
    required this.iconMain,
    required this.mainIconColor,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: WidgetSize(context).sizedBox37,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: WidgetSize(context).sizedBox5,),
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(iconMain, color: mainIconColor, size: WidgetSize(context).sizedBox25,)),
          SizedBox(width: WidgetSize(context).sizedBox10,),
          PermissionTextBoldWidget(text: title),
          SizedBox(width: WidgetSize(context).sizedBox5,),
          PermissionTextSubWidget(text: sub)
        ],
      ),
    );
  }
}
