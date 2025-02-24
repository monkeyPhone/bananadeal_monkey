import 'package:flutter/material.dart';

import '../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';
import '../../../../../../routes/const_element.dart';

class BdListEmpty extends StatelessWidget {
  const BdListEmpty({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      width: WidgetSize(context).widthCommon,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //125 95
                AssetImageBox(imageHeight: WidgetSize(context).width0221, imageWidth: WidgetSize(context).width0291, imageUrl: AppElement.defaultList),
                SizedBox(
                  height: WidgetSize(context).width01,
                ),
                Text('아직 참여한 매장이 없어요.',
                  style: TextStyle(
                      fontSize: WidgetSize(context).sizedBox18,
                      fontWeight: FontWeight.w700,
                      color: Style.grey999999
                  ),
                ),
                Text('동네매장에서 더 많은 초대장을 보내보세요.',
                  style: TextStyle(
                      fontSize: WidgetSize(context).sizedBox18,
                      fontWeight: FontWeight.w700,
                      color: Style.grey999999
                  ),
                ),
                SizedBox(
                  height: WidgetSize(context).sizedBox62,
                ),
              ],
            ),
          ),
          SizedBox(height: WidgetSize(context).width0001,),
        ],
      ),
    );
  }
}
