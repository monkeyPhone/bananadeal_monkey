import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_user_review/helper/review_case/review_case_normal/review_case_normal_block.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_container/container_user_review/helper/review_case/review_case_normal/review_case_normal_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../../../../../models/store/store_detail_review.dart';
import '../../../../../../review_pad.dart';


class ReviewCaseNormal extends StatelessWidget {
  final int index;
  final StoreDetail storeDetail;
  final allTime;
  final Widget? block;
  final List<StoreReViewList> reviewList;
  final bool isInvite;
  const ReviewCaseNormal({
    required this.index,
    required this.storeDetail,
    required this.allTime,
    required this.block,
    required this.reviewList,
    required this.isInvite,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start ,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ReviewCaseNormalBlock(
                    isInvite: isInvite,
                    block: block ?? null, index: index, storeDetail: storeDetail, reviewList: reviewList,)
                ],),
            )
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
        ReviewCaseNormalImage(index: index, reviewList: reviewList,),
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
