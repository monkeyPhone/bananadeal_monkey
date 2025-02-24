import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/widgets/etc_event_list_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/loading.dart';

class EtcEventFutureCorrect extends StatelessWidget {
  const EtcEventFutureCorrect({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<EtcEventController>(
        builder: (controller)=>
        controller.currentTap.value == 0 && controller.currentEvent.length == 0
            ? DefaultView(text1: '진행중인 이벤트가', text2: '없습니다.')
            : controller.currentTap.value == 1 && controller.endEvent.length == 0
                ? DefaultView(text1: '이벤트 목록이', text2: '없습니다.')
                : EtcEventListWidget(
                    scrollController: controller.scrollController,
                    itemCount: controller.currentTap.value == 0 ? controller.currentEvent.length : controller.endEvent.length,
                    currentTap:  controller.currentTap.value == 0,
                    currentEventList: controller.currentEvent,
                    endEventList: controller.endEvent,
        )
    );
  }
}
