import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_block_setting_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_block_setting/helper/etc_block_setting_body_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/loading.dart';

class EtcBlockSettingBody extends GetView<EtcBlockSettingController> {
  const EtcBlockSettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((p0) =>
    !p0.value
        ?  EtcBlockSettingBodyMain()
        :  Loading2(
             text: '차단 목록 수정중이에요.',
           )
        , controller.write);
  }
}
