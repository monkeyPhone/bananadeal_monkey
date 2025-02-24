import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/controllers/store_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store/store_body/helper/store_body_change_bottom_down/store_body_change_bottom_down_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../store_list/store_scroll_list.dart';


class StoreBodyChangeBottomDown extends GetView<StoreController> {
  const StoreBodyChangeBottomDown({
    super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (p0) =>
            p0.isNotEmpty
                ? StoreScrollList()
                : StoreBodyChangeBottomDownSort()
        , controller.storeSearch);
  }
}
