import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/src_body/index_page/index_page_stop.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/src_body/index_page/index_page_use.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../css/style.dart';
import '../controllers/src_info_controller.dart';
import 'false_alert.dart';

class SrcBody extends GetView<SrcInfoController> {
  const SrcBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (fcm) =>
              fcm.value == ''
                  ?   const Center(
                        child: CircularProgressIndicator(
                          color: Style.progressBar,
                        ),
                    )
                  :   ObxValue(
                          (isUse) => isUse.value == '이용중'
                                        ?   IndexPageUse()
                                        :   IndexPageStop()
                      , controller.mIsUsed )
        , controller.fcmToken);
  }
}
