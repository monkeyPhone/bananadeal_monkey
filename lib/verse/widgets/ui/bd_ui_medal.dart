import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:flutter/material.dart';

class BdUiMedal extends StatelessWidget {
  final int index;
  final CommonSize size;

  const BdUiMedal({
    super.key,
    required this.index,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: size.sizedBox5,
        left: size.sizedBox3,
        child: index < 3
            ? ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: BdAssetImageBinder(
            imageHeight:size.sizedBox35,
            imageWidth: size.sizedBox35,
            imageUrl: switch(index){
              0 => medalGold,
              1 => medalSilver,
              _ => medalBronze
            },
            boxFit: BoxFit.contain,
          ),
        ) : const SizedBox()
    );
  }
}