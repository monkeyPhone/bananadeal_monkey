import 'package:flutter/material.dart';

class ResizeText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const ResizeText({
    super.key,
    required this.text,
    required this.textStyle,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
