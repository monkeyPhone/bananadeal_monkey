import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../../../../../../models/store/store_detail_review.dart';
import '../../../../../../../../../components/declaration_dialog_only/declaration_only_dialog_detail.dart';
import '../../../../../helper/review_visibility_icon.dart';

class ReviewCaseBadDeclarationNoVisivility extends StatelessWidget {
  final List<StoreReViewList> reviewList;
  final int index;
  final StoreDetail storeDetail;
  final allTime;
  const ReviewCaseBadDeclarationNoVisivility({
    required this.reviewList,
    required this.index,
    required this.storeDetail,
    required this.allTime,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('차단된 유저의 댓글입니다.',
                  style: TextStyle(
                      fontSize: WidgetSize(context).sizedBox16,
                      fontWeight: FontWeight.w400,
                      color: Style.ultimateGrey
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: WidgetSize(context).sizedBox8,
                ),
                ReviewVisibilityIcon(
                  reviewList: reviewList[index], visible: reviewList[index].visible == 'Y',
                ),
              ],
            ),
            DeclarationOnlyDialogDetail(
              type: "REVIEW", nickName: reviewList[index].mName,
              text: '유저를 신고하시겠어요?', userIdx: reviewList[index].ruUserIdx.toString(),
              ruIdx: reviewList[index].ruIdx.toString(),
              smId: '', someWidget: Text('신고하기',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: WidgetSize(context).sizedBox14,
                  color: Style.greyAAAAAA
              ),
            ),
            )

          ],
        ),
        SizedBox(
          height: WidgetSize(context).sizedBox10,
        ),
        Text('$allTime',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: WidgetSize(context).sizedBox14,
              color: Style.grey999999
          ),
        ),
      ],
    );
  }
}
