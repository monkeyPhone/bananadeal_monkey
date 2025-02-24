import 'package:banana_deal_by_monkeycompany/config/verse/verse_config.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/size/common_size.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BdLayoutSide extends StatelessWidget {
  final SidePadding sidePadding;
  final Widget child;

  const BdLayoutSide({super.key,
    required this.sidePadding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return switch(sidePadding){
      SidePadding.canvasAppbar =>
          Container(
            color: white,
            margin: EdgeInsets.only(bottom: size.sizedSideGap),
            width: size.widthCommon,
            height: size.sizedAppbar,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.sizedSideGap),
              child: child,
            ),
          ),
      SidePadding.customAppbar =>
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.sized16grid),
            margin: EdgeInsets.only(bottom: size.sizedSideGap),
            width: size.widthCommon,
            height: size.sizedAppbar,
            child: child,
          ),
      SidePadding.onlyLeft =>
          Container(
            width: size.widthCommon,
            height: size.sizedAppbar,
            margin: EdgeInsets.only(
                top: size.sizedPaddingHalfDouble,
                bottom: size.sized16grid),
            padding: EdgeInsets.only(
                left: size.sized16grid
            ),
            child: child,
          ),
      _ =>
          SizedBox(
            width: size.widthCommon,
            height: size.sizedAppbar,
            child: Padding(
              padding: switch(sidePadding){
                SidePadding.zero => EdgeInsets.zero,
                _ => EdgeInsets.symmetric(
                    horizontal: size.sized16grid),
              },
              child: child,
            ),
          ),
    };
  }
}
