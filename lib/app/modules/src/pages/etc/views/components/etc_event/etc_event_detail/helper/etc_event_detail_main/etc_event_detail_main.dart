import 'package:banana_deal_by_monkeycompany/app/components/future_builder_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_detail/etc_evnet_detail_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_detail/helper/etc_event_detail_main/etc_event_detail_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EtcEventDetailMain extends GetView<EtcEventDetailController> {
  final int eventIdx;
  final String email;
  const EtcEventDetailMain({
    required this.eventIdx,
    required this.email,
    super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderWidget(
        future: controller.getEventDetail(eventIdx: eventIdx, email: email),
        nextWidget: EtcEventDetailBuilder(
          eventIdx: eventIdx,
        )
    );

  }
}
