import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final List<(String, TextStyle)> list;
  final TextAlign? textAlign;

  const RichTextWidget({super.key,
    required this.list,
    this.textAlign
  });

  @override
  Widget build(BuildContext context) {
    return  RichText(
      text: TextSpan(
          children: List.generate(list.length, (index) =>TextSpan(
              text: list[index].$1,
              style: list[index].$2
            )
          ).toList()
      ),
    );
  }
}
