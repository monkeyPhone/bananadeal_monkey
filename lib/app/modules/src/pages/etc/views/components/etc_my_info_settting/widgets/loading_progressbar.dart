import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../css/style.dart';

class LoadingProgressBar extends GetView<EtcMyInfoSettingController> {
  const LoadingProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  ObxValue(
            (load) =>
            load.value == ''
                ?  Positioned(child: SizedBox())
                :  Positioned.fill(
                      child: Container(
                        color: Colors.black45,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Style.progressBar,
                          ),
                        ),
                      )
                   )
        , controller.loading);
  }
}
