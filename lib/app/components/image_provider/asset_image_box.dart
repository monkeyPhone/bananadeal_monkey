import 'package:flutter/material.dart';

class AssetImageBox extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  final String imageUrl;
  final BoxFit? boxFit;
  const AssetImageBox({
    Key? key,
    required this.imageHeight,
    required this.imageWidth,
    required this.imageUrl,
    this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageHeight,
      width: imageWidth,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: boxFit ?? BoxFit.fill,
          )
      ),
    );
  }
}
