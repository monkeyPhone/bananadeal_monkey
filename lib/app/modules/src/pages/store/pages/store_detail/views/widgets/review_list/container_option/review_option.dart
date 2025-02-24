import 'package:flutter/material.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../models/store/store_detail_review.dart';
import '../review_list_container/review_list_container.dart';

class ReviewOption extends StatelessWidget {
  final StoreDetail storeDetail;
  final List<StoreReViewList> reviewList;
  final int index;
  final bool isInvite;
  const ReviewOption({
    required this.isInvite,
    required this.reviewList,
    required this.storeDetail,
    required this.index,
    super.key});

  @override
  Widget build(BuildContext context) {
    try{
      return ReviewAfterContianer(
        isInvite: isInvite,
        index: index,
        storeDetail: storeDetail,
        reviewList: reviewList,
      );
    } catch(e){
      return Container(
        width: WidgetSize(context).widthCommon,
        decoration: BoxDecoration(
            color: Style.greyF4F4F4,
            borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
        ),
        padding: EdgeInsets.only(top: WidgetSize(context).sizedBox5, right: WidgetSize(context).sizedBox5, left: WidgetSize(context).sizedBox16, bottom: WidgetSize(context).sizedBox12),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('확인할 수 없는 댓글이에요.',
              style: TextStyle(
                  fontSize: WidgetSize(context).sizedBox16,
                  fontWeight: FontWeight.w400,
                  color: Style.ultimateGrey
              ),
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }
  }
}
