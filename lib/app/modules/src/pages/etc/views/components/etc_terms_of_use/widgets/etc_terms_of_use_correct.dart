import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_terms_of_use/etc_terms_of_use_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_terms_of_use/widgets/etc_terms_of_use_scroll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EtcTermsOfUseCorrect extends StatelessWidget {
  const EtcTermsOfUseCorrect({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<EtcTermsOfUseController>(
      builder: (controller)=>
        EtcTermsOfUseScroll(
          scrollController: controller.scrollController,
          text: controller.termsText.value,
          loading: controller.loadings.value,

        ),
    );
  }
}
