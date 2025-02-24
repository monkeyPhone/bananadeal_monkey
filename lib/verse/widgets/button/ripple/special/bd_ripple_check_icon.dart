import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:flutter/material.dart';


class BdRippleCheckIcon extends StatelessWidget {
  final CommonSize size;
  final Color? iconColor;
  final bool? lock;
  final double? padding;
  const BdRippleCheckIcon({super.key,
    required this.size,
    this.iconColor,
    this.padding,
    this.lock,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all( padding ?? size.sizedBox7_5),
      child: Icon(Icons.check,
              size: size.sizedBox24, color: switch(lock!){
              true => yellow,
              false => white
              },),
    );
  }
}
