import 'package:banana_deal_by_monkeycompany/app/components/text_class/resize_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../css/size.dart';

class DealListTextArea extends StatelessWidget {
  final String text;
  final TextStyle style22;
  final TextStyle style18;
  const DealListTextArea({
    required this.text,
    required this.style22,
    required this.style18,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text == '프리미엄폰' || text == '보급폰' || text == '효도폰' || text == '공부폰' || text == '어린이폰'
            ? ResizeText(text: '추천단말기', textStyle: style22, )
            : SizedBox(),
        SizedBox(
          height: WidgetSize(context).sizedBox7_5,
        ),
        ResizeText(
          text: text == '프리미엄폰' || text == '보급폰' || text == '효도폰' || text == '공부폰' || text == '어린이폰'
                  ? '($text)'
                  : text,
          textStyle: text == '프리미엄폰' || text == '보급폰' || text == '효도폰' || text == '공부폰' || text == '어린이폰' || text.length > 24
                       ? style18
                       : style22,
        ),
      ],
    );
  }
}
