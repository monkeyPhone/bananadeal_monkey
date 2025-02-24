import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_user_review/helper/review_case/review_case_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../../models/store/store_detail_review.dart';
import 'helper/global_ban_review.dart';

class ContainerUserReview extends StatelessWidget {
  final int index;
  final StoreDetail storeDetail;
  final List<StoreReViewList> reviewList;
  final bool isInvite;
  const ContainerUserReview({
    required this.index,
    required this.storeDetail,
    required this.reviewList,
    required this.isInvite,
    super.key});

  @override
  Widget build(BuildContext context) {
    DateTime form = reviewList[index].ruRegdate.toLocal();
    var allTime = DateFormat("yyyy.MM.dd").format(form);
    return reviewList[index].ruActivate == 'N'
            ? GlobalBanReview(allTime: allTime)
            : ReviewCaseRoute(
      isInvite: isInvite,
      index: index, storeDetail: storeDetail, allTime: allTime, reviewList: reviewList,);
  }
}
