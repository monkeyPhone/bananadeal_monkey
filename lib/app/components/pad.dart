import 'package:flutter/material.dart';

class Pad extends StatelessWidget {
  final double? height;
  final double? width;
  const Pad({
    this.height,
    this.width,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 0,
      height: height ?? 0,
    );
  }
}
