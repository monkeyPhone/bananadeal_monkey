import 'package:banana_deal_by_monkeycompany/app/components/future_builder_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_block_setting_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_block_setting/helper/etc_block_setting_body_main_correct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/loading.dart';

class EtcBlockSettingBodyMain extends GetView<EtcBlockSettingController> {
  const EtcBlockSettingBodyMain({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderWidget(
        future: controller.getBlockList(),
        nextWidget:  ObxValue((p0) =>
        !p0.value
            ?  EtcBlockSettingBodyMainCorrect()
            :  DefaultView(text1: '차단 목록이 없어요.', text2: ' ',)
            , controller.no)
    );
  }
}
