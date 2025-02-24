import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../../routes/const_element.dart';


class StoreDetailImageDefault extends StatelessWidget {
  const StoreDetailImageDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: Stack(
          children: <Widget>[
            AssetImageBox(imageWidth: WidgetSize(context).widthCommon, imageHeight: WidgetSize(context).widthCommon9_16,
                imageUrl: AppElement.defaultStore),
            Positioned(
              bottom: 0,
              child: Container(
                width: WidgetSize(context).widthCommon,
                height: WidgetSize(context).widthCommon9_16,
                decoration: BoxDecoration(
                  color: Style.blackWrite.withOpacity(0.5),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: WidgetSize(context).sizedBox4, horizontal: WidgetSize(context).sizedBox8),
                child: Center(
                  child: Text(
                    '해당 매장의 대표 이미지가 없습니다.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: WidgetSize(context).sizedBox17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
