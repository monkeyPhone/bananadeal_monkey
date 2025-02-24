import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/svg/bd_svg_binder.dart';
import 'package:flutter/material.dart';

class BdUiStarIcon extends StatelessWidget {
  final double size;
  const BdUiStarIcon({super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return BdSvgBinder(
        color: yellow,
        size: size, icon: iconStar
    );
  }
}
