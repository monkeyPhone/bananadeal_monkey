import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../../components/custom_tap_bar.dart';

class StoreDetailTapbar extends GetView<StoreDetailController> {
  const StoreDetailTapbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTapBar(tabController: controller.tabController, tap1: '홈', tap2: '후기',);
  }
}
