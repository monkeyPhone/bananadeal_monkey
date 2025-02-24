import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComponentEstimateDetailCategory extends StatelessWidget {
  final String title;
  final String content;
  final bool? isPad;
  const ComponentEstimateDetailCategory({super.key,
    required this.title,
    required this.content,
    this.isPad
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
              textStyle: titleLittleBold,
            ),
            const BdCustomPad(padEnum: PadEnum.width32),
            const BdCustomPad(padEnum: PadEnum.width32),
            Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                          width: context.read<VerseConfig>().size.sizedBox1*1.2,
                          color: brown
                        )
                      )
                    ),
                    child: BdTextWidget(
                      text: content,
                      textStyle: titleLittleBrownBold,
                    ),
                  ),
                )
            )
          ],
        ),
        isPad == false ? const SizedBox() : const BdCustomPad(padEnum: PadEnum.height16),
      ],
    );
  }
}
