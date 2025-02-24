import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FcmBodyTapListNormalBoxComponentsView extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String content;
  final Widget? imageBox;
  final bool isRead;
  const FcmBodyTapListNormalBoxComponentsView({super.key,
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.isRead,
    this.imageBox,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Card(
      color: isRead ? white : cream,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.sizedBox10)
      ),
      child: Padding(
        padding: EdgeInsets.all(size.sizedBox10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(size.sizedBox1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.widthCommon),
                    color: Colors.grey.shade300,

                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: BdAssetImageBinder(imageHeight:  size.sizedBox28, imageWidth: size.sizedBox28,
                        imageUrl: imageUrl, boxFit: BoxFit.cover,)

                  ),
                ),

                Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: size.sizedBox10),
                      child:  FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.scaleDown,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: size.sizedBox15),
                          textAlign: TextAlign.left,
                        ),
                      ),

                    )
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.sizedBox10,
                  left: size.sizedBox10
              ),
              child: Text(
                  content,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: size.sizedBox14)
              ),
            ),
            imageBox ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
