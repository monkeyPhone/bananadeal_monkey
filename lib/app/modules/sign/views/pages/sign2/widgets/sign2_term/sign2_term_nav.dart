import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_term/sign2_term_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../components/disable_button.dart';
import '../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';

class Sign2TermNav extends GetView<Sign2TermController> {
  const Sign2TermNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
              ()=> Container(
                color: Style.white,
                height: controller.deviceHeight.value,
                margin: EdgeInsets.only(
                  top: WidgetSize(context).sizedBox16,
                ),
                padding: WidgetSize(context).paddingBodyWhole,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    controller.terms.value  && controller.service.value && controller.location.value
                        ? NeumorphicButtons(
                            text: '다음',
                            onPressed: (){
                              Get.back();
                             }
                            )
                        : DisableButton(
                            text: '다음'
                          )
                         ],
                        ),
                    ),
              )


            )
    ;
  }
}
