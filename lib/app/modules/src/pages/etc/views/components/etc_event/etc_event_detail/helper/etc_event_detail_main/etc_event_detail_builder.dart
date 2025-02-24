import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_detail/etc_evnet_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/event_detail_colum.dart';

class EtcEventDetailBuilder extends StatelessWidget {
  final int eventIdx;
  const EtcEventDetailBuilder({
    required this.eventIdx,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtcEventDetailController>(
        builder: (controller)=>
            EventDetailColumn(
              eventIdx: eventIdx,
              eventDetail: controller.eventDetail.value,
            )
    );
  }
}
