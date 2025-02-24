import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_1_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign1/widgets/helper/sign1_main_area/sign1_case_area/sign1_case_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign1/widgets/helper/sign1_main_area/sign1_image_area/sign1_image_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../routes/const_element.dart';

class Sign1MainArea extends GetView<SignView1Controller> {
  const Sign1MainArea({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (sign1Status) => sign1Status.value == AppElement.statusSuccess
                              ? Sign1ImageArea()
                              : Sign1CaseArea(caseString: sign1Status.value)
        , controller.sign1Status);
  }
}
