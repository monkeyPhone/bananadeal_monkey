import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../../../css/size.dart';

class StoreDetailImageOnText extends GetView<StoreDetailController> {
  final List storePreview;
  const StoreDetailImageOnText({
    required this.storePreview,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
      storePreview.isEmpty || storePreview.length == 1
      ? const SizedBox()
      : Container(
      decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(999)
      ),
      padding: EdgeInsets.symmetric(
          vertical: WidgetSize(context).sizedBox5, horizontal: WidgetSize(context).sizedBox8),
      child: ObxValue(
              (p0) =>
              Text(
                '${p0.value+1}/${storePreview.where((element) => element != '').length}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: WidgetSize(context).sizedBox13,
                  fontWeight: FontWeight.w700,
                ),
              )
          , controller.current),
    );
  }
}
