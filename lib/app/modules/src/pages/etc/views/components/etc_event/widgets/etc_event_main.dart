import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/widgets/etc_event_future_correct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../components/future_builder_widget.dart';


class EtcEventMain extends GetView<EtcEventController> {
  const EtcEventMain({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderWidget(
      future: controller.getEvent(),
      nextWidget: EtcEventFutureCorrect(),
    );
  }
}
