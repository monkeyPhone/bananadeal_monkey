import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';

class ComponentEstimateDetailContent extends StatelessWidget {
  final String title;
  final String content;
  final bool? isPad;
  final bool? isColor;
  const ComponentEstimateDetailContent({super.key,
    required this.title,
    required this.content,
    this.isPad,
    this.isColor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BdTextWidget(
              text: title,
            ),
            const BdCustomPad(padEnum: PadEnum.width32),
            const BdCustomPad(padEnum: PadEnum.width32),
            Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: BdTextWidget(
                    textStyle: isColor == true ? bodyRed : null,
                    text: content,
                  ),
                )
            )
          ],
        ),
        isPad == false ? const SizedBox() : const BdCustomPad(padEnum: PadEnum.height8),
      ],
    );
  }
}
