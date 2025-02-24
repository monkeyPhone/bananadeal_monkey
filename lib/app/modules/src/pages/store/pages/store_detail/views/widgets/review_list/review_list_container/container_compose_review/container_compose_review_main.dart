import 'package:flutter/material.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../../models/store/store_detail_review.dart';
import '../helper/review_declaration_button/review_declaration_button.dart';

class ContainerComposeReviewMain extends StatelessWidget {
  final StoreDetail storeDetail;
  final List<StoreReViewList> reviewList;
  final int index;
  final bool insInvite;
  const ContainerComposeReviewMain({
    required this.reviewList,
    required this.storeDetail,
    required this.index,
    required this.insInvite,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Style.greyEAEAEA,
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
      ),
      margin: EdgeInsets.only(top: WidgetSize(context).sizedBox12),
      padding: EdgeInsets.all(WidgetSize(context).sizedBox12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('사장님 댓글',
                style: TextStyle(
                    fontSize: WidgetSize(context).sizedBox14,
                    fontWeight: FontWeight.w700,
                    color: Style.blackWrite
                ),
              ),
              ReviewDeclarationButton(
                isInvite: insInvite,
                type: 'STORE', storeDetail: storeDetail,)
            ],
          ),
          SizedBox(height: WidgetSize(context).sizedBox12,),
          Text(reviewList[index].raAnswer!,
            style: TextStyle(
                fontSize: WidgetSize(context).sizedBox14,
                fontWeight: FontWeight.w400,
                color: Style.blackWrite
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
