import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/helper/review_visibility_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../../../../models/store/store_detail_review.dart';

class ReviewCaseBadDeclarationOnReview extends StatelessWidget {
  final List<StoreReViewList> reviewList;
  final int index;
  final String viTitle;
  final allTime;
  const ReviewCaseBadDeclarationOnReview({
    required this.reviewList,
    required this.index,
    required this.viTitle,
    required this.allTime,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('신고접수가 완료되었어요',
                      style: TextStyle(
                          fontSize: WidgetSize(context).sizedBox16,
                          fontWeight: FontWeight.w400,
                          color: Style.ultimateGrey
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                ReviewVisibilityIcon(reviewList: reviewList[index], visible: reviewList[index].visible == 'Y',)
              ],
            ),
            Text('(${viTitle})',
              style: TextStyle(
                  fontSize: WidgetSize(context).sizedBox16,
                  fontWeight: FontWeight.w400,
                  color: Style.ultimateGrey
              ),
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
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
