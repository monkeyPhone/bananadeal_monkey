import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class BdCustomPad extends StatelessWidget {
  final PadEnum padEnum;
  const BdCustomPad({super.key,
    required this.padEnum
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize widgetSize = context.read<VerseConfig>().size;
    return SizedBox(
      height: switch(padEnum){
        PadEnum.navPad => widgetSize.sizedAppbar,
        PadEnum.heightFloating => widgetSize.sizedAppbar+widgetSize.sized32grid,
        PadEnum.height1 => widgetSize.sizedBox2_5,
        PadEnum.height2 => widgetSize.sized2grid,
        PadEnum.height4 => widgetSize.sized4grid,
        PadEnum.height8 => widgetSize.sized8grid,
        PadEnum.height12 => widgetSize.sized12grid,
        PadEnum.height16 => widgetSize.sized16grid,
        PadEnum.height20 => widgetSize.sized20grid,
        PadEnum.height24 => widgetSize.sized24grid,
        PadEnum.height32 => widgetSize.sized32grid,
        PadEnum.heightQuarter => widgetSize.sizedPaddingHalfDouble,

        _ => null,
      },
      width: switch(padEnum){
        PadEnum.width1 => widgetSize.sizedBox2_5,
        PadEnum.width4 =>  widgetSize.sizedBox4,
        PadEnum.widthQuarter => widgetSize.sizedPaddingHalfDouble,
        PadEnum.width8 => widgetSize.sized8grid,
        PadEnum.width12 => widgetSize.sized12grid,
        PadEnum.width16 => widgetSize.sized16grid,
        PadEnum.width24 => widgetSize.sized24grid,
        PadEnum.width32 => widgetSize.sized32grid,
        PadEnum.specialAddress => widgetSize.sizedPaddingOnlyAppBar,
        _ => null,
      },
    );
  }
}

