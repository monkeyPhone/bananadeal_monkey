import 'package:banana_deal_by_monkeycompany/app/models/store/store_detail_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/widgets/review_list/review_list_correct.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../models/store/store_detail_review.dart';


class ReviewList extends StatelessWidget {
  final bool all;
  final StoreDetail storeDetail;
  final List<StoreReViewList> reviewList;
  final bool isInvite;

  const ReviewList({
    required this.all,
    required this.storeDetail,
    required this.reviewList,
    required this.isInvite,

    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return reviewList.isEmpty
             ?  SizedBox(
                  height: WidgetSize(context).sizedBox62,
                  child: Center(
                  child: Text(
                     '등록된 후기가 없어요.',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: WidgetSize(context).sizedBox16,
                          color: Style.ultimateGrey
                          ),
                        ),
                      ),
                    )
             :  ReviewListCorrect(
      isInvite: isInvite,
      all: all, storeDetail: storeDetail, itemCount: reviewList.length, reviewList: reviewList,);
  }

}

