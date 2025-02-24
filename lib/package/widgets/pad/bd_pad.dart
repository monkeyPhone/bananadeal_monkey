import 'package:banana_deal_by_monkeycompany/package/common/bd_common.dart';
import 'package:banana_deal_by_monkeycompany/package/common/size/common_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum PadEnum {
  navPad,
  heightFloating, height2, height4, height20,
  width4, width8, width12, width16, width24, width32, height8, height12, height16, height24, height32, heightQuarter,
  height1, widthQuarter, width1, specialAddress,
}

class BdPad extends StatelessWidget {
  final PadEnum padEnum;
  const BdPad({super.key,
    required this.padEnum
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<BdCommon>().size;
    return SizedBox(
      height: switch(padEnum){
        PadEnum.navPad => size.sizedAppbar,
        PadEnum.heightFloating => size.sizedAppbar+size.sized32grid,
        PadEnum.height1 => size.sizedBox2_5,
        PadEnum.height2 => size.sized2grid,
        PadEnum.height4 => size.sized4grid,
        PadEnum.height8 => size.sized8grid,
        PadEnum.height12 => size.sized12grid,
        PadEnum.height16 => size.sized16grid,
        PadEnum.height20 => size.sized20grid,
        PadEnum.height24 => size.sized24grid,
        PadEnum.height32 => size.sized32grid,
        PadEnum.heightQuarter => size.sizedPaddingHalfDouble,

        _ => null,
      },
      width: switch(padEnum){
        PadEnum.width1 => size.sizedBox2_5,
        PadEnum.width4 =>  size.sizedBox4,
        PadEnum.widthQuarter => size.sizedPaddingHalfDouble,
        PadEnum.width8 => size.sized8grid,
        PadEnum.width12 => size.sized12grid,
        PadEnum.width16 => size.sized16grid,
        PadEnum.width24 => size.sized24grid,
        PadEnum.width32 => size.sized32grid,
        PadEnum.specialAddress => size.sizedPaddingOnlyAppBar,
        _ => null,
      },
    );
  }
}
