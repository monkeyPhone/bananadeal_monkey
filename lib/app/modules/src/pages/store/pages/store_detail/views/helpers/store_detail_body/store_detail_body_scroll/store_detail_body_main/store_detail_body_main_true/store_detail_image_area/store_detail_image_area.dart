import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_image_area/store_detail_image_default.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_image_area/store_detail_image_on.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../models/store/store_detail_info.dart';

class StoreDetailImageArea extends StatelessWidget {
  final StoreDetail storeDetail;
  final List storePreview;

  const StoreDetailImageArea({
    required this.storeDetail,
    required this.storePreview,

    super.key});

  @override
  Widget build(BuildContext context) {
    return
      storePreview.isEmpty
        ? StoreDetailImageDefault()
        : StoreDetailImageOn(
            storePreview: storePreview,
      );
  }
}
