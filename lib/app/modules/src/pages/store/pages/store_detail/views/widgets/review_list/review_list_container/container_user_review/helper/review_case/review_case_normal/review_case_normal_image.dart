import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_user_review/helper/review_case/review_case_normal/review_image_area.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../models/store/store_detail_review.dart';

class ReviewCaseNormalImage extends StatelessWidget {
  final int index;
  final List<StoreReViewList> reviewList;
  const ReviewCaseNormalImage({
    required this.index,
    required this.reviewList,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
      reviewList[index].ruPathImg1 != '' || reviewList[index].ruPathImg2 != '' || reviewList[index].ruPathImg3 != ''
        ?   Padding(
              padding: EdgeInsets.only(top: WidgetSize(context).sizedBox12, bottom:WidgetSize(context).sizedBox10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ReviewImageArea(imagePath: reviewList[index].ruPathImg1,),
                    ReviewImageArea(imagePath: reviewList[index].ruPathImg2,),
                    ReviewImageArea(imagePath: reviewList[index].ruPathImg3,),
                  ],
                ),
              ),
            )
        : SizedBox(
            height: WidgetSize(context).sizedBox10,
      );
  }
}
