import 'package:banana_deal_by_monkeycompany/app/models/store/store_detail_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/container_option/review_option.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../models/store/store_detail_review.dart';



class ReviewListContainerOption extends StatelessWidget {
  final StoreDetail storeDetail;
  final List<StoreReViewList> reviewList;
  final int index;
  final bool isInvite;
  const ReviewListContainerOption({
    required this.reviewList,
    required this.storeDetail,
    required this.index,
    required this.isInvite,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            bottom: WidgetSize(context).sizedBox14
        ),
        child: ReviewOption(reviewList: reviewList, storeDetail: storeDetail, index: index, isInvite: isInvite,)
    );
  }

}
