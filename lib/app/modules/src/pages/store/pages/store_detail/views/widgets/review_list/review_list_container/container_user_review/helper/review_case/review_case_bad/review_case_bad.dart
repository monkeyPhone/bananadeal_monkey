import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_user_review/helper/review_case/review_case_bad/review_case_bad_declaration/review_case_bad_declaration.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_user_review/helper/review_case/review_case_bad/review_case_bad_declaration_visivility/review_case_bad_declaration_no_visivility.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_user_review/helper/review_case/review_case_bad/review_case_bad_declaration_visivility/review_case_bad_declaration_visivility.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../../../../../models/store/store_detail_review.dart';

class ReviewCaseBad extends StatelessWidget {
  final List<StoreReViewList> reviewList;
  final int index;
  final StoreDetail storeDetail;
  final allTime;
  final bool isInvite;
  const ReviewCaseBad({
    required this.reviewList,
    required this.index,
    required this.storeDetail,
    required this.allTime,
    required this.isInvite,
    super.key});

  @override
  Widget build(BuildContext context) {
    return reviewList[index].ruIsReport == 'Y'
                ? ReviewCaseBadDeclaration(index: index, storeDetail: storeDetail, allTime: allTime, reviewList: reviewList, )
                : reviewList[index].visible == 'Y'
                    ?  ReviewCaseBadDeclarationVisivility(isInvite: isInvite, index: index, storeDetail: storeDetail, allTime: allTime, reviewList: reviewList,)
                    :  ReviewCaseBadDeclarationNoVisivility(index: index, storeDetail: storeDetail, allTime: allTime, reviewList: reviewList,);
  }
}
