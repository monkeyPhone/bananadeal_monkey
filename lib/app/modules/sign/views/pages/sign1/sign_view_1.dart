import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign1/widgets/helper/sign1_button_area/sign1_button_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign1/widgets/helper/sign1_main_area/sign1_main_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../css/size.dart';
import '../../../../../css/style.dart';
import '../../../controllers/sign_view_1_controller.dart';


class SignView1 extends GetView<SignView1Controller> {
  const SignView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async{
        if(didPop) {
          return;
        }
        await controller.backButton(context);
      },
      child: Scaffold(
          backgroundColor: Style.white,
          appBar: AppBar(),
          body: Container(
              color: Style.white,
              width: WidgetSize(context).widthCommon,
              padding: WidgetSize(context).paddingBodyWhole,
              height: WidgetSize(context).heightCommon,
              child: Column(
                children: [
                  Expanded(child: Sign1MainArea()),
                  SizedBox(height: WidgetSize(context).sizedBox32,),
                  Sign1ButtonArea(),
                ],
              )
          )
      ),
    );
  }

  //image area


}