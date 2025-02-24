import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_user_review/helper/review_case/review_case_bad/review_case_bad_declaration/review_case_bad_declaration_off_review_image.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/helper/review_visibility_icon.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_pad.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../../../../models/store/store_detail_review.dart';

class ReviewCaseBadDeclarationOffReview extends StatelessWidget {
  final List<StoreReViewList> reviewList;
  final int index;
  final allTime;
  const ReviewCaseBadDeclarationOffReview({
    required this.reviewList,
    required this.index,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text:
                    reviewList[index].mName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: WidgetSize(context).sizedBox18,
                    ),
                  ),
                ),
                ReviewPadWidth1(),
                Icon(Icons.star,color: Style.yellow, size: WidgetSize(context).sizedBox18,),
                ReviewPadWidth2(),
                Text('${reviewList[index].ruPoint}', style: TextStyle(
                    fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w400
                ),),
                ReviewPadWidth3()
              ],
            ),
            ReviewVisibilityIcon(reviewList: reviewList[index], visible: reviewList[index].visible == 'Y')
          ],
        ),
        ReviewPadTop(),
        Text(reviewList[index].ruContent,
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox14,
              fontWeight: FontWeight.w400,
              color: Style.blackWrite
          ),
          textAlign: TextAlign.start,
        ),
        ReviewCaseBadDeclarationOffReviewImage(index: index, reviewList: reviewList,),
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
