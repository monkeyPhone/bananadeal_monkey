import 'package:banana_deal_by_monkeycompany/app/modules/invite/controller/invite_deal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'invite_select_box_button.dart';

class InviteSelectBoxs extends GetView<InviteDealController> {
  const InviteSelectBoxs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(2, (index) =>
          GestureDetector(
            onTap: (){
              controller.clickAllButton(index: index);
            },
            onLongPress: (){
              controller.selectedBoxLongClick();
            },
            child: InviteSelectBoxButton(index: index,),
          )
      ),
    );
  }
}
