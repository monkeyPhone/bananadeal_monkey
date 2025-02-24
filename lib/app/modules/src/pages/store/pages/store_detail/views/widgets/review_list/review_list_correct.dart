import 'package:banana_deal_by_monkeycompany/app/models/store/store_detail_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_back.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/container_option/review_list_container_option.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../models/store/store_detail_review.dart';


class ReviewListCorrect extends StatelessWidget {
  final bool all;
  final StoreDetail storeDetail;
  final bool isInvite;
  final int itemCount;
  final List<StoreReViewList> reviewList;
  const ReviewListCorrect({
    required this.all,
    required this.storeDetail,
    required this.isInvite,
    required this.itemCount,
    required this.reviewList,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      child: Column(children: [
        ...List.generate(
          !all
            ? itemCount < 5
              ? itemCount
              : 5
            : itemCount, (index) =>
            ReviewListContainerOption(storeDetail: storeDetail, index: index, reviewList: reviewList,
                isInvite: isInvite
            ),
        ).toList(),
        StoreDetailBack()
      ],)
    );
  }
}
