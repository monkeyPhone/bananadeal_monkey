import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../change_map_controller.dart';
import '../actions_button.dart';

class ChangeMapAppbar extends GetView<ChangeMapController> {
  const ChangeMapAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (range) =>
            BasicAppbar2(
              leading: (){
                controller.appBarBackButton();
              },
              actions: ActionsButton(),
              lotation: range.value,
            )
        , controller.rangeChange);
  }
}
