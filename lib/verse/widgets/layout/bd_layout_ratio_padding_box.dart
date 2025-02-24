import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BdLayoutRatioPaddingBox extends StatelessWidget {

  final Color? color;
  final PaddingRatioEnum? paddingEnum;
  final Widget child;
  const BdLayoutRatioPaddingBox({super.key,

    this.paddingEnum,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      padding: switch(paddingEnum){
      PaddingRatioEnum.grid1632 => EdgeInsets.symmetric(
          horizontal: size.sized16grid,
          vertical: size.sized32grid
        ),
        PaddingRatioEnum.grid1616 => EdgeInsets.all(
            size.sized16grid
        ),
        PaddingRatioEnum.vertical32 => EdgeInsets.symmetric(
            vertical: size.sized32grid
        ),
        PaddingRatioEnum.horizontal => EdgeInsets.symmetric(
            horizontal: size.sized16grid
        ),
        PaddingRatioEnum.all32 => EdgeInsets.all(size.sized32grid),
      null => null
      },
      width: size.widthCommon,
      height: size.ratio58,
      color: color ?? white,
      child: child,
    );
  }
}
