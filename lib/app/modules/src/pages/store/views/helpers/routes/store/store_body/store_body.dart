import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../components/loading.dart';
import '../../../../../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_store_controller.dart';
import 'helper/store_body_change0.dart';



class StoreBody extends GetView<BdBotNavStoreController> {
  const StoreBody({
    super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((cha) =>
    cha.value == 0
        ? StoreBodyChange0()
        : Loading2(text: '잠시만 기다려주세요')
        , controller.change);
  }
}
