import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../controllers/store_controller.dart';


class StroeBodyChangeResizeBox extends GetView<StoreController> {
  const StroeBodyChangeResizeBox({
    super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (p0) =>
                SizedBox(
                    height: p0.isNotEmpty
                        ? WidgetSize(context).sizedBox8
                        : MediaQuery.of(context).viewInsets.bottom

                )
        , controller.storeSearch);
  }
}
