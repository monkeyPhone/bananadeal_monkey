import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SnackbarBasicContent extends StatelessWidget {

  final String? imageUrl;
  final String title;
  final String text;
  const SnackbarBasicContent({super.key,

    required this.imageUrl,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;

    return SizedBox(
      width: size.widthCommon,
      height: size.height60px,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:  CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.sizedBox12),
                border: Border.all(
                    width:size.sizedBox1,
                    color: cream
                )
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(size.sizedBox12),
                child: BdAssetImageBinder(
                    imageHeight: size.sizedBox45,
                    imageWidth: size.sizedBox45,
                    imageUrl: imageUrl ?? bananaLaunch
                )

            ),
          ),
          SizedBox(width: size.sizedBox10,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.sizedBox10),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(
                        color: white,
                        fontSize: size.sizedBox17, fontWeight: FontWeight.w700,), textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis, maxLines: 1,),
                      SizedBox(height: size.sizedBox7_5,),
                      Text(text, style: TextStyle(
                        color: white,
                        fontSize: size.sizedBox15, fontWeight: FontWeight.w400,),textAlign: TextAlign.left, maxLines: 7,
                      ),

                    ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
