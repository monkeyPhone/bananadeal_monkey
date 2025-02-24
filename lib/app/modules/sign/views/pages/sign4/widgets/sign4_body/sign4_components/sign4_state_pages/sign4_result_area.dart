import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_4_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign4/widgets/sign4_body/sign4_components/sign4_state_pages/sign4_default_view.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign4/widgets/sign4_body/sign4_components/sign4_state_pages/sign4_fail_search.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign4/widgets/sign4_body/sign4_components/sign4_state_pages/sign4_search_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sign4ResultArea extends StatelessWidget {
  const Sign4ResultArea({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignView4Controller>(
      builder: (controller){
        return  controller.error.value == '' && controller.addressInfo.value.results.juso.isNotEmpty
                      ? Sign4SearchResult(
                          addressInput: controller.addressInput.value,
                          totalCount: controller.addressInfo.value.results.common.totalCount,
                          jusoLength: controller.addressInfo.value.results.juso.length,
                          )
                      : controller.error.value != '정상' && controller.addressInput.value != ''
                          ? Sign4FailSearch(errorMessage: controller.addressInfo.value.results.common.errorMessage,)
                          : Sign4DefaultView();
      },
    );
  }
}
