import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_1_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../../css/style.dart';
import '../../../../sign2/sign_view_2.dart';

class Sign1ButtonArea extends GetView<SignView1Controller> {
  const Sign1ButtonArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      child: SafeArea(
        child: ObxValue(
                (height) => Container(
                    height: height.value,
                    color: Style.white,
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        NeumorphicButtons(
                          text: '시작하기',
                          onPressed: () async{
                            Get.to(() => const SignView2());
                          },
                        )
                      ],
                    )


                ), controller.device)
      ),
    );;
  }
}
