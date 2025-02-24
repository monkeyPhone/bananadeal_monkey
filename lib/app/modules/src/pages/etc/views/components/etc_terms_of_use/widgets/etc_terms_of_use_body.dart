import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_terms_of_use/etc_terms_of_use_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_terms_of_use/widgets/etc_terms_of_use_correct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/future_builder_widget.dart';

class EtcTermsOfUseBody extends GetView<EtcTermsOfUseController> {
  const EtcTermsOfUseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderWidget(
      future: controller.getTermsofUse(),
      nextWidget: EtcTermsOfUseCorrect(),
    );
  }
}
