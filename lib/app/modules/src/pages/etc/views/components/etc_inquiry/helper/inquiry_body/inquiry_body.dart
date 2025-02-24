import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/etc_inquiry_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/inquiry_body/inquiry_main/inquiry_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../css/style.dart';

class InquiryBody extends GetView<EtcInquiryController> {
  const InquiryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((change)=>
    change.value
        ?  Center(
            child: CircularProgressIndicator(
              color: Style.progressBar,
              ),
            )
        : InquiryMain()
        , controller.sendInq);
  }
}
