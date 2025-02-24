import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign3/widgets/helpers/sign3_bottom_nav/sign3_bottom_nav_children.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../../../controllers/sign_view_3_controller.dart';

class Sign3BottomNav extends GetView<SignView3Controller> {
  const Sign3BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((p0) => Container(
      color: Style.white,
      child: SafeArea(
        child: Container(
            color: Style.white,
            height: p0.value,
            padding: WidgetSize(context).paddingBodyWhole,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Sign3BottomNavChildren()
              ],
            )

        ),
      ),
    ), controller.deviceHeight);
  }
}
