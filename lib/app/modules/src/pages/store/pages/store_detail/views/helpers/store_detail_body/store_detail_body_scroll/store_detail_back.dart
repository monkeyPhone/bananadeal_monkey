import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';

class StoreDetailBack extends GetView<StoreDetailController> {
  const StoreDetailBack({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (loading) =>
          !loading.value
              ?  SizedBox(
            height: WidgetSize(context).sizedBox30,
            )
              : SizedBox(
            width: WidgetSize(context).widthCommon,
            height: WidgetSize(context).height60px,
            child: Center(
              child: CircularProgressIndicator(
                color: Style.progressBar,
              ),
            ),
          )
        , controller.loadingBar
    );
  }
}
