import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/size.dart';
import '../../change_map_controller.dart';
import '../range_change_view/range_chage_view.dart';
import 'change_map_current/change_map_current_view.dart';

class ChangeMapExpandedChild extends GetView<ChangeMapController> {
  final BuildContext mediaContext;
  const ChangeMapExpandedChild({
    required this.mediaContext,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (range) =>
            range.value
                ?   Column(
                      children: [
                        Expanded(child: RangeChageView()),
                        SizedBox(height: WidgetSize(context).extendsGap,)
                      ],
                    )
                :   ChangeMapCurrentView(mediaContext: mediaContext,),
        controller.rangeChange);
  }
}
