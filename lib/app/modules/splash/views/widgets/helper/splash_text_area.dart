import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../css/size.dart';
import '../../../../../css/style.dart';
import '../../../controllers/splash_controller.dart';
import 'box_text.dart';

class SplashTextArea extends GetView<SplashController> {
  const SplashTextArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      child: SafeArea(
        child: Container(
            padding: WidgetSize(context).paddingBodyWhole,
            color: Style.white,
            height: WidgetSize(context).height60px,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetX<SplashController>(
                    builder: (spC){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BoxText( text:
                              spC.currentVersion.value == ''
                                  ? '앱 버전 체크 진행중.......'
                                  : '현재 버전 : ${spC.currentVersion.value}'),
                          BoxText( text:
                              spC.versionNew.value.result.isEmpty
                                  ? '최신 정보 전송 중.......'
                                  : '최신 버전 : ${spC.versionNew.value.result.first.auVersion}'),
                        ],
                      );
                    }
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

}
