import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../../models/store/store_detail_review.dart';
import '../../review_case_normal/review_image_area.dart';

class ReviewCaseBadDeclarationOffReviewImage extends StatelessWidget {
  final List<StoreReViewList> reviewList;
  final int index;

  const ReviewCaseBadDeclarationOffReviewImage({
    required this.reviewList,
    required this.index,

    super.key});

  @override
  Widget build(BuildContext context) {
    return reviewList[index].ruPathImg1 != '' || reviewList[index].ruPathImg2 != '' || reviewList[index].ruPathImg3 != ''
        ?
    Padding(
      padding: EdgeInsets.symmetric(vertical:WidgetSize(context).sizedBox5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ReviewImageArea(imagePath: reviewList[index].ruPathImg1),
            ReviewImageArea(imagePath: reviewList[index].ruPathImg2),
            ReviewImageArea(imagePath: reviewList[index].ruPathImg3)
          ],
        ),
      ),
    )
        : SizedBox(
      height: WidgetSize(context).sizedBox10,
    );
  }
}
