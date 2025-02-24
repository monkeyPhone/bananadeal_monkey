import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../../../../../../models/store/store_detail_review.dart';
import '../../../../../../../../../components/declaration_dialog_only/declaration_only_dialog_detail.dart';
import '../../../../../helper/review_visibility_icon.dart';
import '../../review_case_normal/review_case_normal.dart';

class ReviewCaseBadDeclarationVisivility extends StatelessWidget {
  final List<StoreReViewList> reviewList;
  final int index;
  final StoreDetail storeDetail;
  final allTime;
  final bool isInvite;
  const ReviewCaseBadDeclarationVisivility({
    required this.reviewList,
    required this.index,
    required this.storeDetail,
    required this.allTime,
    required this.isInvite,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ReviewCaseNormal(
        isInvite: isInvite,
        reviewList: reviewList,
        index: index, storeDetail: storeDetail, allTime: allTime,
        block: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReviewVisibilityIcon(
                reviewList: reviewList[index], visible: reviewList[index].visible == 'Y',
              ),
              DeclarationOnlyDialogDetail(
                type: "REVIEW", nickName: reviewList[index].mName,
                text: '유저을(를) 신고하시겠어요?', userIdx: reviewList[index].ruUserIdx.toString(),
                ruIdx: reviewList[index].ruIdx.toString(),
                smId: '', someWidget: Text('신고하기', style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: WidgetSize(context).sizedBox14,
                  color: Style.greyAAAAAA
              ),
              ),
              )
            ],
          ),
        )
    );
  }
}
