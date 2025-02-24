import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../css/style.dart';
import 'button/detail_bnb.dart';

class StoreDetailNavBar extends GetView<StoreDetailController> {
  const StoreDetailNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (detail) =>
            !detail.value
                ? const SizedBox()
                : ObxValue(
                    (tap)=>
                tap.value == 0
                    ? DetailBnb()
                    : Container(
                  color: Style.white,
                  child: SafeArea(
                    child: SizedBox(),
                  ),
                ), controller.currentTap
            )
        , controller.updateFail);
  }
}
