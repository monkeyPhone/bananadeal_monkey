import 'package:flutter/material.dart';
import '../../../../css/size.dart';

class MapContentText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  const MapContentText({
    required this.text,
    this.textColor,
    this.fontSize,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: fontSize ?? WidgetSize(context).sizedBox18,
          fontWeight: FontWeight.w400
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
    );
  }
}
