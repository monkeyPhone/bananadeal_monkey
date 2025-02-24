import 'package:banana_deal_by_monkeycompany/app/models/store/store_detail_review.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../components/declaration_dialog/declaration_dialog_detail.dart';

class ReviewDeclarationButton extends StatelessWidget {
  final String type;
  final StoreReViewList? reviewList;
  final StoreDetail storeDetail;
  final bool isInvite;
  const ReviewDeclarationButton({
    required this.isInvite,
    required this.type,
    this.reviewList,
    required this.storeDetail,
    super.key});

  @override
  Widget build(BuildContext context) {
    return   type == 'STORE'
        ?
    DeclarationDialogDetail(
      isInvite: isInvite,
      text: '매장을 신고하시겠어요?',
      nickName: storeDetail.smStoreName,
      someWidget: Text('신고/차단',
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: WidgetSize(context).sizedBox14,
            color: Style.greyAAAAAA
        ),
      ), type: "REVIEW", userIdx: '', smId: storeDetail.smMId, ruIdx: '',
    )
        :
    DeclarationDialogDetail(
      isInvite: isInvite,
      text: '유저를 신고하시겠어요?',
      nickName: reviewList!.mName,
      someWidget: Text('신고/차단',
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: WidgetSize(context).sizedBox14,
            color: Style.greyAAAAAA
        ),
      ), type: "REVIEW", userIdx: reviewList!.ruUserIdx.toString(), smId: '', ruIdx: reviewList!.ruIdx.toString(),
    );
  }
}
