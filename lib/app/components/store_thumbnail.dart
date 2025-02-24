import 'package:flutter/material.dart';
import '../routes/api_url.dart';
import '../routes/const_element.dart';
import 'image_provider/image_providers.dart';

class StoreThumbnail extends StatelessWidget {
  final double thumbRadius;
  final double thumbSize;
  final String imageUrl;
  const StoreThumbnail({
    required this.thumbRadius,
    required this.thumbSize,
    required this.imageUrl,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(thumbRadius),
      child: ImageProviders(
          imageWidth:  thumbSize,
          imageHeight: thumbSize,
          imageUrl: ApiConsole.imageBananaUrl+imageUrl,
          errUrl: AppElement.defaultStore,
          imageLabel: AppElement.caseThumb),
    );
  }
}
