import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/controllers/make_deal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../../routes/const_element.dart';
import '../../../../../../../../views/widgets/start_deal/views/step_last.dart';
import '../../../../../make_deal_body/body1/body1_view.dart';
import '../../../../../make_deal_body/body2/body2_view.dart';
import '../../../../../make_deal_body/body3/body3_view.dart';
import '../../../../../make_deal_body/body4/body4_view.dart';
import '../../../../../make_deal_body/body5/body5_view.dart';
import '../../../../../make_deal_body/body6/body6_view.dart';
import '../../../../../make_deal_body/body7/body7_view.dart';
import '../../../../../make_deal_body/body8/step_modal_promotion.dart';

class MakeDealBody extends GetView<MakeDealController> {
  const MakeDealBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((page) {
      switch(page.value){
        case 1:
          return Body1View();
        case 2:
          return Body2View();
        case 3:
          return Body3View();
        case 4:
          return Body4View();
        case 5:
          return Body5View();
        case 6:
          return Body6View();
        case 7:
          return Body7View();
        case 8:
          return StepModalProMotion1();
        case 9:
          return Obx(
                  (){
                return
                  ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          StepLast(
                            routeCase: controller.requestAgency.value,
                            joinCategory: controller.joinCategory.value,
                            agencyCategory: controller.agencyCategory.value,
                            joinerAge: controller.joinerAge.value,
                            joinerPhone: controller.joinerPhone.value == controller.check1Text[4]
                                            ? '추천 단말기'
                                            : controller.joinerPhone.value,
                            joinerPhoneRec: controller.joinerPhone.value == controller.check1Text[4]
                                               ? controller.recPhoneString()
                                               : 'x', //joinerPhoneRec.value,
                            joinerRateplan: controller.joinerRateplan.value == controller.check1Text[6] || controller.joinerRateplan.value == ''
                                              ? '추천 요금제'
                                              : controller.joinerRateplan.value,
                            joinerRateRec: controller.recRateString(),//joinerRateRec.value,
                            maxInstallment: controller.stepModal1TextMax.value == '' ? AppElement.promotion1 : controller.stepModal1TextMax.value,
                            stepModal2TextSale: controller.stepModal2TextSale.value == '' ? AppElement.promotion1 : controller.stepModal2TextSale.value,
                            stepModal3Text: controller.stepModal3Text.value == '' ? AppElement.promotion2 : controller.stepModal3Text.value,
                            stepModal4Text: controller.stepModal4Text.value == '' ? AppElement.promotion2 : controller.stepModal4Text.value,
                            cont: controller.textField,
                          ),
                        ],
                      ),
                    ],
                  );
              }
          );
        case 10:
          return Center(
            child: Text(''),
          );
        default:
          return Center(
            child: Text(''),
          );
      }
    }, controller.currentStep);
  }
}
