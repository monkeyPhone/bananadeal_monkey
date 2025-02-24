import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../components/addr_text_area.dart';
import '../../../../../../../css/size.dart';

class RangeAddressArea extends GetView<SrcInfoController> {
  const RangeAddressArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: WidgetSize(context).sizedBox16, vertical: WidgetSize(context).sizedBox22 ),
      child: ObxValue(
          (dong)=> AddrTextArea(
            address: dong.value,
          ), controller.mAdd
      ),
    );
  }
}
