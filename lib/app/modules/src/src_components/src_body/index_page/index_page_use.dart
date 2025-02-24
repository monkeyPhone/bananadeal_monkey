
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/home/views/widgets/home_components/home.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/bottom_nav_bar/controllers/bd_bot_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../pages/chat/views/chat_view.dart';
import '../../../pages/deal/views/deal_view.dart';
import '../../../pages/etc/views/etc_view.dart';
import '../../../pages/store/views/store_view.dart';

class IndexPageUse extends GetView<BdBotNavController> {
  const IndexPageUse({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (page) => IndexedStack(
          index: page.value,
          children: [
            Home(),
            page.value == 1 ? StoreView() : const SizedBox(),
            DealView(),
            ChatView(),
            EtcView()
          ],
        )
        , controller.pageSrcChangeIndex);
  }
}
