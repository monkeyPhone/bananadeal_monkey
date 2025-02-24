import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_user_review/helper/review_case/review_case_bad/review_case_bad.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_user_review/helper/review_case/review_case_normal/review_case_normal.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../../../../models/store/store_detail_review.dart';

class ReviewCaseRoute extends StatelessWidget {
  final int index;
  final StoreDetail storeDetail;
  final List<StoreReViewList> reviewList;
  final allTime;
  final bool isInvite;
  const ReviewCaseRoute({
    required this.index,
    required this.storeDetail,
    required this.allTime,
    required this.reviewList,
    required this.isInvite,
    super.key});

  @override
  Widget build(BuildContext context) {
    return reviewList[index].ruIsBlock == 'Y'
            ? ReviewCaseBad(
      isInvite: isInvite,
      index: index, storeDetail: storeDetail, allTime: allTime, reviewList: reviewList,)
            : ReviewCaseNormal(
      isInvite: isInvite,
      index: index, storeDetail: storeDetail, allTime: allTime, block: null, reviewList: reviewList,);
    //_visibleReview(index: index, storeReview: storeReview, allTime: allTime);
  }
}
