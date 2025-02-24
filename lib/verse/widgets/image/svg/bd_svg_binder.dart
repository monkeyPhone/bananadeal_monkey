import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BdSvgBinder extends StatelessWidget {
  final double size;
  final String icon;
  final Color? color;
  const BdSvgBinder({
    super.key,
    required this.size,
    required this.icon,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: color != null
          ? SvgPicture.asset(
        icon,
        width: size,
        colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
      )
          : SvgPicture.asset(
        icon,
        width: size,
      ),
    );
  }
}