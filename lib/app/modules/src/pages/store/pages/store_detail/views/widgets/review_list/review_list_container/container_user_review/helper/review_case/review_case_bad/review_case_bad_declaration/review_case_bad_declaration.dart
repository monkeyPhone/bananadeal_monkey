import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_user_review/helper/review_case/review_case_bad/review_case_bad_declaration/review_case_bad_declaration_off_review.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_user_review/helper/review_case/review_case_bad/review_case_bad_declaration/review_case_bad_declaration_on_review.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../../../../../../models/store/store_detail_review.dart';

class ReviewCaseBadDeclaration extends StatelessWidget {
  final List<StoreReViewList> reviewList;
  final int index;
  final StoreDetail storeDetail;
  final allTime;
  const ReviewCaseBadDeclaration({
    required this.reviewList,
    required this.index,
    required this.storeDetail,
    required this.allTime,
    super.key});

  @override
  Widget build(BuildContext context) {
    return reviewList[index].visible == 'N'
            ?  ReviewCaseBadDeclarationOnReview(
                  index: index,
                  viTitle: reviewList[index].bruTitle,
                  allTime: allTime, reviewList: reviewList,
               )
          : ReviewCaseBadDeclarationOffReview(index: index, allTime: allTime, reviewList: reviewList,);

  }
}
