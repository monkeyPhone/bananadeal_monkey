import 'package:banana_deal_by_monkeycompany/verse/widgets/app_data/bd_rich_text_element.dart';
import 'package:flutter/material.dart';

class BdRichText extends StatelessWidget {
  final List<BdRichTextElement> children;
  const BdRichText({super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          children: children.map((e) => TextSpan(text: e.text, style: e.style)).toList()
      ),
    );
  }
}
