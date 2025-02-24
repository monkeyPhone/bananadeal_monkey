import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_tap/store_detail_tap_current_list.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../../../../models/store/store_detail_review.dart';


class StoreDetailTap extends GetView<StoreDetailController> {
  final bool isInvite;
  final StoreDetail storeDetail;
  final List<StoreReViewList> reviewList;
  final List storeEvent;
  final List storeIcon;
  const StoreDetailTap({
    required this.storeDetail,
    required this.reviewList,
    required this.storeEvent,
    required this.storeIcon,
    required this.isInvite,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (current) => current.value == 0
        ? StoreDetailTapCurrentList(
              isInvite: isInvite,
        storeDetail: storeDetail, reviewList: reviewList, storeEvent: storeEvent, storeIcon: storeIcon)
        : ReviewList(
              isInvite: isInvite,
      storeDetail: storeDetail, all: true,
      reviewList: reviewList,
    ) , controller.currentTap);
  }
}
