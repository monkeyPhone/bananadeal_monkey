import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class BdLayoutPadding extends StatelessWidget {
  final PaddingEnum? padding;
  final Widget child;
  const BdLayoutPadding({super.key,
    this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    final double padding32 = size.sized32grid;
    final double padding24 = size.sized24grid;
    final double padding16 = size.sized16grid;
    final double padding8 = size.sized8grid;
    return Padding(
      padding: switch(padding){
        null => EdgeInsets.zero,
        PaddingEnum.all => EdgeInsets.all(padding16),
        PaddingEnum.verticalOri => EdgeInsets.symmetric(vertical: size.sized16grid),
        PaddingEnum.progressBar => EdgeInsets.only(
          left: padding16,
          right: padding16,
          top: size.sizedSideGap,
        ),
        PaddingEnum.lrb16 => EdgeInsets.only(
          left: padding16,
          right: padding16,
          bottom: padding16,
        ),
        PaddingEnum.vertical16 =>  EdgeInsets.only(
            top: padding24,
            bottom: padding16
        ),
        PaddingEnum.vertical32 =>  EdgeInsets.only(
            top: padding32,
            bottom: padding16
        ),
        PaddingEnum.axis3216 => EdgeInsets.symmetric(
            horizontal: padding16,
            vertical: padding32
        ),
        PaddingEnum.axis0516 => EdgeInsets.symmetric(
            vertical: size.sizedBox5,
            horizontal: padding16
        ),
        PaddingEnum.axis1216 => EdgeInsets.only(
            top: padding16,
            bottom: padding8,
            left: padding16,
            right: padding16,
        ),
        PaddingEnum.onlyLeft => EdgeInsets.only(
          left: padding16,
        ),
        PaddingEnum.all8 => EdgeInsets.all(
          padding8,
        ),
        PaddingEnum.right1 => EdgeInsets.only(
          right: size.sizedBox1_5,
        ),
        PaddingEnum.all4 => EdgeInsets.all(
          size.sizedBox4,
        ),
        PaddingEnum.all32 => EdgeInsets.all(
          padding32,
        ),
        PaddingEnum.allTop32 => EdgeInsets.only(
            top: padding32,
            left: padding16,
            right: padding16,
            bottom: padding16
        ),
        PaddingEnum.dialog => EdgeInsets.only(
          top: padding8,
          left: padding16,
          right: padding16,
          bottom: padding16,
        ),
        PaddingEnum.home => EdgeInsets.all(
            padding16
        ),
        PaddingEnum.horizontal => EdgeInsets.symmetric(
            horizontal: padding16
        ),
        PaddingEnum.horizontal32 => EdgeInsets.symmetric(
            horizontal: padding32
        ),
        PaddingEnum.horizontal4 => EdgeInsets.symmetric(
            horizontal: size.sizedBox5
        ),
        PaddingEnum.horizontal24 => EdgeInsets.symmetric(
            horizontal: padding24
        ),
        PaddingEnum.horizontal8 => EdgeInsets.symmetric(
            horizontal: padding8
        ),
        PaddingEnum.left => EdgeInsets.only(
            left: padding16
        ),
        PaddingEnum.category => EdgeInsets.only(
            left: padding16,
            right: padding16,
            top: padding8,
            bottom: padding16
        ),
      },
      child: child,
    );
  }
}