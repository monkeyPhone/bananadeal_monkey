import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/bottom_nav_bar/controllers/bd_bot_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../pages/etc/views/etc_view.dart';
import '../default_view.dart';

class IndexPageStop extends GetView<BdBotNavController> {
  const IndexPageStop({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (page) => IndexedStack(
              index: page.value,
              children: [
                const DefaultSrcView(),
                const DefaultSrcView(),
                const DefaultSrcView(),
                const DefaultSrcView(),
                EtcView(),
              ],
            )
        , controller.pageIndex);
  }
}
