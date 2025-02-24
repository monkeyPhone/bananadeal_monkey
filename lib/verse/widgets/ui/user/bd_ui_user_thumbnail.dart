import 'dart:io';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_stack.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdUiUserThumbnail extends StatelessWidget {
  final GestureTapCallback onTap;
  final String thumb;
  final bool? isNetwork;
  const BdUiUserThumbnail({super.key,
    required this.onTap,
    required this.thumb,
    this.isNetwork,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdRippleButtonStack(
      isDelay: false,
      border: Border.all(
          color: greyD7D7D7,
          width: size.sizedBox1_5
      ),
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: switch(thumb){
          '' =>
              BdAssetImageBinder(
                imageHeight: size.ratio58_2,
                imageWidth: size.ratio58_2,
                imageUrl: defaultThumb,
                boxFit: BoxFit.cover,
              ),
          'delete' =>
              BdAssetImageBinder(
                imageHeight: size.ratio58_2,
                imageWidth: size.ratio58_2,
                imageUrl: defaultThumb,
                boxFit: BoxFit.cover,
              ),
          _ => switch(isNetwork){
            null => !kIsWeb
                ?
            Image.file(
              File(thumb),
              fit: BoxFit.cover,
              height: size.ratio58_2,
              width: size.ratio58_2,
            )
                : Image.network(thumb,   fit: BoxFit.cover,
              height: size.ratio58_2,
              width: size.ratio58_2,),
            _ => BdImageBinder(
              imageHeight: size.ratio58_2,
              imageWidth: size.ratio58_2,
              imageUrl: '${context.read<VerseConfig>().url.imageBananaUrl}$thumb',
              errUrl: defaultThumb, imageLabel: 'thumb',
            )
          }



        },
      ),
      // switch(thumb){
      //   '' => onTap,
      //   _ => (){
      //     context.read<UserInfoEvent>().changeImageDialog(context);
      //   }
      // },
    );
  }
}
