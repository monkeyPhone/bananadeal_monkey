import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/widgets/etc_obx_main_use_state.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/widgets/etc_obx_value_main_ban_state.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EtcObxValueMain extends GetView<SrcInfoController> {
  const EtcObxValueMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (user)=>
        user.value.mIsUsed == '이용중'
            ? EtcObxMainUseState()
            : EtcObxValueMainBanState()
        ,SrcInfoController.to.infoM
    );
  }
}
