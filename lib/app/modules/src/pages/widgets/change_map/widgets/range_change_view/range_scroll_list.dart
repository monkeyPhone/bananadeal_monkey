import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/range_change_view/range_scroll_list_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../css/size.dart';
import '../../change_map_controller.dart';

class RangeScrollList extends GetView<ChangeMapController> {
  const RangeScrollList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      controller: controller.changeRangeC,
      child: ListView(
        controller: controller.changeRangeC,
        children: [
          Padding(
            padding: WidgetSize(context).paddingBodyWhole,
            child: RangeScrollListButton(),
          ),
        ],
      ),
    );
  }
}
