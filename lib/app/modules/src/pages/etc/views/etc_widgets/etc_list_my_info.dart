import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/list_container.dart';

class EtcListMyInfo extends GetView<EtcController> {
  const EtcListMyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListContainer(index: 1, text: '내 정보', onTap1: controller.onTap1(),);
  }
}
