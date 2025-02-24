import 'package:banana_deal_by_monkeycompany/app/components/loading/home_loading_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../css/style.dart';

class StoreLoadingBar extends GetView<StoreController> {
  const StoreLoadingBar({
    super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
        (load) =>
        load.value
            ? HomeLoadingBar()
            : SizedBox()
      ,controller.loading
    );
  }
}
