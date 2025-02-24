import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../src_components/controllers/src_info_controller.dart';
import 'helpers/default/store_default.dart';


class StoreView extends GetView<SrcInfoController> {
  const StoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return ObxValue(
            (longitude) => longitude.value.mLongitude.isEmpty
                ? const StoreDefault()
                : StoreRoutes()
        , controller.infoM);
  }

}
