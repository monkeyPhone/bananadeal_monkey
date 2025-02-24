import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../models/store/store_detail_review.dart';

class ReviewVisibilityIcon extends GetView<StoreDetailController> {
  final StoreReViewList reviewList;
  final bool visible;
  const ReviewVisibilityIcon({
    required this.reviewList,
    required this.visible,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          controller.changeVisibility(reviewList);
        },
        child: Icon(visible ? Icons.visibility_off : Icons.visibility, size: WidgetSize(context).sizedBox20, color: Colors.grey[700],));
  }
}
