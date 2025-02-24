import 'package:flutter/material.dart';

import '../../../../../../../../../components/image_provider/image_provider_state.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../routes/const_element.dart';

class EventDetailImageArea extends StatelessWidget {
  final String imagePath;
  const EventDetailImageArea({
    required this.imagePath,
    super.key});

  @override
  Widget build(BuildContext context) {
    return imagePath != ''
        ?  ImageProviderState(
              imageWidth: WidgetSize(context).widthCommon,
              imageUrl: ApiConsole.imageBananaUrl+imagePath,
              errUrl: AppElement.defaultImg,  aspectRatio: AppElement.caseNotice
           )
        :  SizedBox();
  }
}
