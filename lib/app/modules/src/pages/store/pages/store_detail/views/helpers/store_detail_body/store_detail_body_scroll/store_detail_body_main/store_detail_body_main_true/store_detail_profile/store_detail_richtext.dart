import 'package:flutter/material.dart';


class StoreDetailRichText extends StatelessWidget {
  final String text;
  final int maxLines;
  final FontWeight fontWeight;
  final double fontSize;
  const StoreDetailRichText({
    required this.text,
    required this.maxLines,
    required this.fontWeight,
    required this.fontSize,
    super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: TextAlign.start,
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontWeight: fontWeight,
          color: Colors.black,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
