import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_detail/etc_evnet_detail_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_detail/helper/etc_event_detail_main/etc_event_detail_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../components/loading.dart';

class EtcEventDetailBody extends GetView<EtcEventDetailController> {
  final int eventIdx;
  final String email;
  const EtcEventDetailBody({
    required this.eventIdx,
    required this.email,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((p0) =>
    p0.value == 0
        ? EtcEventDetailMain(eventIdx: eventIdx, email: email,)
        : Loading2(text: '잠시만 기다려주세요.')
        , controller.pageChange);
  }
}
