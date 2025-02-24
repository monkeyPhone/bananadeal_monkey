import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_image_area/store_detail_image_box.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_image_area/store_detail_image_on_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../css/size.dart';


class StoreDetailImageOn extends StatelessWidget {
  final List storePreview;

  const StoreDetailImageOn({
    required this.storePreview,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StoreDetailImageBox(
          storePreview: storePreview,
        ),
        Positioned(
          bottom: WidgetSize(context).sizedBox2,
          right: WidgetSize(context).sizedBox2,
          child:  StoreDetailImageOnText(storePreview: storePreview,),
        ),
      ],
    );
  }
}
