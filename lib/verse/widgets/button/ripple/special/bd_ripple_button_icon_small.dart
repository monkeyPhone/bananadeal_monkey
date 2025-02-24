import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:flutter/material.dart';


class BdRippleButtonIconSmall extends StatelessWidget {
  final CommonSize size;
  final GestureTapCallback onTap;
  final IconData icon;
  const BdRippleButtonIconSmall({super.key,
    required this.size,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.sizedPaddingHalfDouble,
      right: size.sizedPaddingHalfDouble,
      child: BdRippleButtonBasic(
          onTap: onTap,
          height: size.sizedBox26,
          width: size.sizedBox26,
          padding: EdgeInsets.all(size.sizedBox1_5),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(999),
          child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Icon(icon,
                color: greyWrite,
              ))
      ),
    );
  }
}
