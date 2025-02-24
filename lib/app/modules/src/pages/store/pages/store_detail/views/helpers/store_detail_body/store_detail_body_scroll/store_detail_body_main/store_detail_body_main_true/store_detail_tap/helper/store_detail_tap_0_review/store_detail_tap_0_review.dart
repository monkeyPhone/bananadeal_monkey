import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_tap/helper/store_detail_tap_0_review/store_detail_tap_0_review_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../../../../../../models/store/store_detail_review.dart';

class StoreDetailTap0Review extends StatelessWidget {
  final StoreDetail storeDetail;
  final List<StoreReViewList> reviewList;
  final bool isInvite;
  const StoreDetailTap0Review({
    required this.isInvite,
    required this.storeDetail,
    required this.reviewList,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: WidgetSize(context).height60px,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('매장 후기',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: WidgetSize(context).sizedBox18
                ),
              ),
              StoreDetailTap0ReviewButton(reviewList: reviewList,)
            ],
          ),
        ),
        ReviewList(
          isInvite: isInvite,
          storeDetail: storeDetail,
          all: false,
          reviewList: reviewList,
        )
      ],
    );
  }
}
