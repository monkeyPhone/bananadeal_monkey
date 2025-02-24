import 'package:banana_deal_by_monkeycompany/app/models/store/store_detail_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_compose_review/container_compose_review.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/store/store_detail_review.dart';
import 'container_user_review/container_user_review.dart';


class ReviewAfterContianer extends StatelessWidget {
  final int index;
  final StoreDetail storeDetail;
  final List<StoreReViewList> reviewList;
  final bool isInvite;
  const ReviewAfterContianer({
    required this.index,
    required this.storeDetail,
    required this.reviewList,
    required this.isInvite,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: WidgetSize(context).widthCommon,
      decoration: BoxDecoration(
          color: Style.greyF4F4F4,
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
      ),
      padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerUserReview(
            isInvite: isInvite,
            index: index,
            storeDetail: storeDetail,
            reviewList: reviewList,
          ),
//TODO : 여기까지
          ContainerComposeReview(
            isInvite: isInvite,
            index: index,
            storeDetail: storeDetail,
            reviewList: reviewList,
          )
        ],
      ),
    );
  }


}

