import 'package:flutter/material.dart';
import '../../../../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../../../../routes/const_element.dart';

class EtcInfoBodyCurrentCropUploadIncaseThumb extends StatelessWidget {
  final String mPathImg;
  const EtcInfoBodyCurrentCropUploadIncaseThumb({
    required this.mPathImg,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
            width: WidgetSize(context).sizedBox1,
            color: Style.greyC4C4C4
        ),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: ImageProviders(
              imageWidth: WidgetSize(context).sizedBox136,
              imageHeight: WidgetSize(context).sizedBox136,
              imageUrl: ApiConsole.imageBananaUrl+mPathImg,
              errUrl: AppElement.defaultThumb,
              imageLabel: AppElement.caseThumb
          )

      ),
    );
  }
}
