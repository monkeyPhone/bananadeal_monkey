import 'package:flutter/material.dart';

import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';


class AppBarButtonList extends StatelessWidget {
  final String text;
  final Color colorBackground;
  final Color colorBorder;
  final Color colorText;
  final VoidCallback onPressed;
  const AppBarButtonList({
    Key? key,
    required this.text,
    required this.colorBackground,
    required this.colorBorder,
    required this.colorText,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: WidgetSize(context).width003),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16, vertical: WidgetSize(context).sizedBox8),
                side: BorderSide(width: WidgetSize(context).sizedBox1_5, color: colorBorder),
                backgroundColor: colorBackground,
                surfaceTintColor: Style.white,
                minimumSize: Size(WidgetSize(context).width001, WidgetSize(context).width007),
                shape: const StadiumBorder()
              ),
              onPressed: onPressed, child: Text(text, style: TextStyle(
            fontWeight: FontWeight.w400,
            color: colorText,
            fontSize: WidgetSize(context).sizedBox14,
          ),
          )
          ),
        ),
      ],
    );
  }
}
