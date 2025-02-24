import 'package:flutter/material.dart';

class EstimateMainInfoRow2Text extends StatelessWidget {
  final String text1;
  final TextStyle textStyle;
  const EstimateMainInfoRow2Text({
    required this.text1,
    required this.textStyle,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(text1 ,style: textStyle);
  }
}
