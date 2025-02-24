import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_text_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../../../../models/store/store_detail_review.dart';

class StoreDetailTap0ReviewButton extends GetView<StoreDetailController> {
  final List<StoreReViewList> reviewList;
  const StoreDetailTap0ReviewButton({
    required this.reviewList,
    super.key});

  @override
  Widget build(BuildContext context) {
    return reviewList.isEmpty
        ? SizedBox()
        : RippleTextButton(
        onTap: (){
          controller.selectAll();
        },
        text: '전체 후기 보기'
    );
  }
}
