import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_3_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';


class Sign3BodyNickText extends StatelessWidget {
  const Sign3BodyNickText({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SignView3Controller>(
      builder: (controller){
        return Text(
         controller.validate.value,
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox14,
              color: !controller.valiColor.value
                  ? Style.red
                  : Colors.blue
          ),
        );
      },
    );
  }
}
