import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/result_area_components/change_default_view.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/result_area_components/fail_search.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/result_area_components/search_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../change_map_controller.dart';


class ResultArea extends StatelessWidget {
  const ResultArea({
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeMapController>(builder:
    (controller){
      return
        // controller.longtitude.value == '' && controller.latitude.value == '' && controller.dong.value == '' && controller.addr.value == ''
        //           ?

                      controller.error.value == '' && controller.addressInfo.value.results.juso.isNotEmpty
                        ?   SearchResult()
                        :   controller.error.value != '정상' && controller.addressInput.value != ''
                                ?   const FailSearch()
                                :   controller.notice.value == ''
                                        ?   Center(child: const ChangeDefaultView())
                                        :   const FailSearch();
                  // :   const LastView();
      }
    );
  }

}
