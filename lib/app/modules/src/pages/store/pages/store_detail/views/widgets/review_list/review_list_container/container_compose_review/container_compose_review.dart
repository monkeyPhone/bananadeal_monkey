import 'package:banana_deal_by_monkeycompany/app/models/store/store_detail_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_compose_review/container_compose_review_main.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../models/store/store_detail_review.dart';


class ContainerComposeReview extends StatelessWidget {
  final StoreDetail storeDetail;
  final List<StoreReViewList> reviewList;
  final int index;
  final bool isInvite;
  const ContainerComposeReview({
    required this.reviewList,
    required this.storeDetail,
    required this.index,
    required this.isInvite,
    super.key});

  @override
  Widget build(BuildContext context) {
    return reviewList[index].raAnswer != null
        ? ContainerComposeReviewMain(storeDetail: storeDetail, index: index, reviewList: reviewList, insInvite: isInvite,)
        : SizedBox();
  }
}
