import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdLayoutRati58Pad32 extends StatelessWidget {
  final PaddingEnum? padding;
  final Widget child;
  final bool? isHalf;
  const BdLayoutRati58Pad32({super.key,
    this.padding,
    required this.child,
    this.isHalf
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdLayoutPadding(
      padding: padding,
      child: Column(
        children: [
          SizedBox(
            width: size.widthCommon,
            height: switch(isHalf){
              null => size.ratio58,
              _ => size.ratio58/2
            },
            child: child,
          ),
          const BdCustomPad(
              padEnum: PadEnum.height32
          )
        ],
      ),
    );
  }
}
