import 'package:flutter/material.dart';
import '../../../../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../routes/const_element.dart';

class EtcInfoBodyCurrentUploadDefault extends StatelessWidget {
  const EtcInfoBodyCurrentUploadDefault({super.key});

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
          child:  ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: AssetImageBox(
                  imageHeight: WidgetSize(context).sizedBox136,
                  imageWidth: WidgetSize(context).sizedBox136,
                  imageUrl: AppElement.defaultThumb
              )

          )

      ),
    );
  }
}
