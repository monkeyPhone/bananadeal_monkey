import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/etc_some_inquiry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../css/app_basic_component/basic_app_bar_text.dart';

class EtcSomeInquiryAppBar extends GetView<EtcSomeInquiryController> {
  const EtcSomeInquiryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicAppbar(
      leading: (){
        controller.leadingSome();
      },
      title: BasicAppBarText(
        text: '자주 하는 질문',
      ),
    );
  }
}
