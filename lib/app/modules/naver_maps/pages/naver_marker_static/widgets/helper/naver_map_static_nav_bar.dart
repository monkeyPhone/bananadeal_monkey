import 'package:banana_deal_by_monkeycompany/app/components/disable_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/neumorphic_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../css/size.dart';
import '../../naver_marker_static_controller.dart';

class NaverMapStaticNavBar extends GetView<NaverMarkerStaticController> {
  const NaverMapStaticNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ObxValue(
            (height) =>
                SizedBox(
                  height: height.value,
                  child: Padding(
                    padding: WidgetSize(context).paddingBodyWhole,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       ObxValue((complete) =>
                           complete.value
                               ?  NeumorphicButtons(
                               text: '확인',
                               onPressed: (){
                                 Get.back();
                               }
                           ) : DisableButton(text: '지도 초기화 중')
                           , controller.isComplete)
                      ],
                    ),
                  ),
                )
        ,controller.deviceHeight)

    );
  }
}
