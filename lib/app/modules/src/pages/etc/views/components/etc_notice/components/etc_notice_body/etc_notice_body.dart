import 'package:banana_deal_by_monkeycompany/app/components/future_builder_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_notice/etc_notice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'etc_notice_main/etc_notice_main.dart';

class EtcNoticeBody extends GetView<EtcNoticeController> {
  const EtcNoticeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderWidget(
        future: controller.getQuestionList(),
        nextWidget: EtcNoticeMain()
    );
  }
}
