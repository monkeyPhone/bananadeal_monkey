import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/list_container.dart';

class EtcListAs extends GetView<EtcController> {
  const EtcListAs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListContainer(index: 7, text: '1:1 문의', onTap7: controller.onTap7(),);
  }
}
