import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class _ImageBinderHelper {
  BoxFit getBoxFit(String imageLabel){
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
}

class BdImageBinder extends StatelessWidget {
  final BoxBorder? imageBorder;
  final BorderRadiusGeometry? imageRadius;
  final EdgeInsetsGeometry? margin;
  final double imageWidth;
  final double imageHeight;
  final String imageUrl;
  final String errUrl;
  final String imageLabel;
  const BdImageBinder({
    this.imageBorder,
    this.imageRadius,
    this.margin,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageUrl,
    required this.errUrl,
    required this.imageLabel,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return switch(kIsWeb){
      true =>
          Container(
            margin: margin,
            width: imageWidth,
            height: imageHeight,
            decoration: BoxDecoration(
              borderRadius: imageRadius,
              border: imageBorder,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: _ImageBinderHelper().getBoxFit(imageLabel),
              ),
            ),
          ),
      false =>
          CachedNetworkImage(
            width: imageWidth,
            height: imageHeight,
            imageUrl: imageUrl,
            // fadeInDuration: const Duration(milliseconds: 100),
            //   fadeOutDuration: const Duration(milliseconds: 200),
            imageBuilder: (context, imageProvider) {
              return Container(
                margin: margin,
                width: imageWidth,
                height: imageHeight,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: imageRadius,
                  border: imageBorder,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: _ImageBinderHelper().getBoxFit(imageLabel),
                  ),
                ),
              );
            },
            placeholder: (context, url) => _PlaceHolder(imageWidth: imageWidth, imageHeight: imageHeight),
            errorWidget: (context, url, error) => _ErrorWidget(imageWidth: imageWidth, imageHeight: imageHeight, errUrl: errUrl, imageLabel: imageLabel,),
          )
    };
  }
}


class _PlaceHolder extends StatelessWidget {
  final double imageWidth;
  final double imageHeight;

  const _PlaceHolder({
    required this.imageWidth,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: const Center(
        child: CircularProgressIndicator(
          color: progressBar,
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final double imageWidth;
  final double imageHeight;
  final String errUrl;
  final String imageLabel;
  const _ErrorWidget({
    required this.imageWidth,
    required this.imageHeight,
    required this.errUrl,
    required this.imageLabel
  });

  @override
  Widget build(BuildContext context) {
    return BdAssetImageBinder(
      imageWidth: imageWidth,
      imageHeight: imageHeight,
      imageUrl: errUrl,
      boxFit: _ImageBinderHelper().getBoxFit(imageLabel),
    );
  }
}
