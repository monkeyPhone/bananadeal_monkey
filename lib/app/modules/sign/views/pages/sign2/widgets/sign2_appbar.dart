import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sign2Appbar extends GetView<SignView2Controller> {
  const Sign2Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((p0) =>
        p0.value == ''
        ? BasicAppbar2(
          lotation: false,
          leading: (){
            if( MediaQuery.of(context).viewInsets.bottom >0 ){
              FocusScope.of(context).unfocus();
            } else{
              controller.srcBackFunc(context);
            }
          },

        )
            : SizedBox(height: WidgetSize(context).height60px,)
        , controller.newbie);
  }
}
