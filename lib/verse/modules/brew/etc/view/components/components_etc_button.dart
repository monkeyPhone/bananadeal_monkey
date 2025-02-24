import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComponentsEtcButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;
  const ComponentsEtcButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdRippleButtonBasic(
      // border: Border.all(
      //   width: widgetSize.sizedBox1,
      //   color: Colors.grey.shade300
      // ),
        height: size.ratio58_4,
        padding: EdgeInsets.only(
            left: size.sized16grid,
            right: size.sized12grid
        ),
        onTap: onTap,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: BdTextWidget(
                    text: title,
                    textStyle: bodyBold,
                  ),
                )
            ),
            const BdCustomPad(padEnum: PadEnum.width16),
            Icon(Icons.arrow_forward_ios,
              size: size.sized16grid,
            )
          ],
        )
    );
  }
}
