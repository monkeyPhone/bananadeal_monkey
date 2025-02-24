import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../css/style.dart';
import 'asset_image_box.dart';

class ImageProviders extends StatelessWidget {
  final BoxBorder? imageBorder;
  final double? imageRadius;
  final double imageWidth;
  final double imageHeight;
  final String imageUrl;
  final String errUrl;
  final String imageLabel;
  const ImageProviders({
    this.imageBorder,
    this.imageRadius,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageUrl,
    required this.errUrl,
    required this.imageLabel,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxFit getBoxFit(){
      switch (imageLabel) {
        case 'banner':
          return BoxFit.fill;
        case 'thumb':
          return BoxFit.cover;
        case 'height':
          return BoxFit.fitHeight;
        case 'review':
          return BoxFit.cover;
        case 'other':
          return BoxFit.fill;
        case 'carousel':
          return BoxFit.contain;
        default:
          return BoxFit.fill;
      }

    }

    Widget errorWidget() {
      return AssetImageBox(
        imageWidth: imageWidth,
        imageHeight: imageHeight,
        imageUrl: errUrl,
        boxFit: getBoxFit(),
      );
    }

    Widget placeHolder() {
      return SizedBox(
        width: imageWidth,
        height: imageHeight,
        child: const Center(
          child: CircularProgressIndicator(
            color: Style.progressBar,
          ),
        ),
      );
    }
    return CachedNetworkImage(
      width: imageWidth,
      height: imageHeight,
      imageUrl: imageUrl,

      // fadeInDuration: const Duration(milliseconds: 100),
      //   fadeOutDuration: const Duration(milliseconds: 200),
      imageBuilder: (context, imageProvider) {
        return Container(
          width: imageWidth,
          height: imageHeight,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(imageRadius ?? 0),
            border: imageBorder,
            image: DecorationImage(
              image: imageProvider,
              fit: getBoxFit(),
            ),
          ),
        );
      },
      placeholder: (context, url) => placeHolder(),
      errorWidget: (context, url, error) => errorWidget(),
    );

  }
}
