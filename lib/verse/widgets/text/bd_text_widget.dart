import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdTextWidget extends StatelessWidget {
  final String text;
  final String? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  const BdTextWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text == '' ? ' ' : text,
      style: context.read<VerseConfig>().size.switchTextStyle(label: textStyle),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}