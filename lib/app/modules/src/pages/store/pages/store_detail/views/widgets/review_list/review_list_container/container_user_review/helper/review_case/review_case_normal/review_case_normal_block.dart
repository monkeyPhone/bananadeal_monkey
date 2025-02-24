import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../../../../../models/store/store_detail_review.dart';
import '../../../../../../../../../../../../src_components/controllers/src_info_controller.dart';
import '../../../../helper/review_declaration_button/review_declaration_button.dart';

class ReviewCaseNormalBlock extends StatelessWidget {
  final bool isInvite;
  final Widget? block;
  final int index;
  final StoreDetail storeDetail;
  final List<StoreReViewList> reviewList;
  const ReviewCaseNormalBlock({
    required this.isInvite,
    required this.block,
    required this.index,
    required this.storeDetail,
    required this.reviewList,
    super.key});

  @override
  Widget build(BuildContext context) {
    return block ?? (reviewList[index].ruUserIdx != SrcInfoController.to.infoM.value.mIdx
        ? ReviewDeclarationButton(
        isInvite: isInvite,
        type: 'USER', reviewList: reviewList[index], storeDetail: storeDetail)
        : SizedBox());
  }
}
