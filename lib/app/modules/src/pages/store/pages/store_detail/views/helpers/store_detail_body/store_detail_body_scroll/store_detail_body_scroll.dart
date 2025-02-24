import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../css/size.dart';

class StoreDetailBodyScroll extends GetView<StoreDetailController> {
  final int midx;
  final int? indexs1;
  final int? rong;
  final bool isInvite;
  const StoreDetailBodyScroll({
    required this.midx,
    required this.indexs1,
    required this.rong,
    required this.isInvite,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: WidgetSize(context).paddingBodyWhole,
      physics: const ClampingScrollPhysics(),
      controller: controller.scrollController,
      children: [
        StoreDetailBodyMain(midx: midx, indexs1: indexs1, rong: rong, isInvite: isInvite,),
      ],
    );
  }
}
