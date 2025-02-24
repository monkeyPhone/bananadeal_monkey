import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BdSvgBinder2 extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final BoxFit? boxFit;
  final String imageUrl;
  const BdSvgBinder2({
    super.key,
    required this.width,
    required this.height,
    this.padding,
    this.boxFit,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      child: FittedBox(
        fit: boxFit ?? BoxFit.fitWidth,
        child: !kIsWeb
            ? SvgPicture.asset(
            imageUrl
        )
            : Image.network(imageUrl),
      ),
    );
  }
}