import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../css/size.dart';

class TextNoRead extends StatelessWidget {
  final String text;
  const TextNoRead({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: WidgetSize(context).sizedBox12,
          color: Colors.blue
      ),
    );
  }
}
