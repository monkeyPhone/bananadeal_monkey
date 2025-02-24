import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/skeleton/bd_skeleton_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';


class BdImageBinderCalculate extends StatefulWidget {
  final String imageUrl;
  final (double width, double height) placeSize;
  const BdImageBinderCalculate({super.key,
    required this.imageUrl,
    required this.placeSize
  });

  @override
  State<BdImageBinderCalculate> createState() => _BdImageBinderCalculateState();
}

class _BdImageBinderCalculateState extends State<BdImageBinderCalculate> {

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: widget.placeSize.$1,
      height: widget.placeSize.$2,
      imageUrl: widget.imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: widget.placeSize.$1,
          height: widget.placeSize.$2,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        );

      },
      placeholder: (context, url) => _PlaceHolder(widget.placeSize),
      errorWidget: (context, url, error) => _ErrorWidget(widget.placeSize),
    );
  }
}



class _PlaceHolder extends StatelessWidget {
  final (double width, double height) placeSize;
  const _PlaceHolder(this.placeSize);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: placeSize.$1,
      height: placeSize.$2,
      child:  const Center(
        child: CircularProgressIndicator(
          color: yellow,
        ),
      ),
    );

  }
}

class _ErrorWidget extends StatelessWidget {
  final (double width, double height) placeSize;
  const _ErrorWidget(this.placeSize);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: placeSize.$1,
      height: placeSize.$2,
      child: Center(
        child: BdAssetImageBinder(
          imageUrl: defaultImg,
          imageWidth: placeSize.$1,
          imageHeight:(1/1.618)*placeSize.$1,
        ),
      ),
    );
  }
}