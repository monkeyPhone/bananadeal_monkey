import 'package:flutter/material.dart';

import '../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../../../../../routes/api_url.dart';
import '../../../../../../../../routes/const_element.dart';

class ThumbNailBefore extends StatelessWidget {
  final String imageUrl;
  const ThumbNailBefore({
    required this.imageUrl,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: WidgetSize(context).sizedBox1, color: Style.greyD9D9D9),
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
          child: ImageProviders(
              imageWidth: WidgetSize(context).sizedBox65,
              imageHeight: WidgetSize(context).sizedBox65,
              imageUrl: ApiConsole.imageBananaUrl+imageUrl,
              errUrl: AppElement.defaultThumb,
              imageLabel: AppElement.caseThumb
          )

      ),
    );
  }
}
