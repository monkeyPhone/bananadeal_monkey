
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../components/disable_button.dart';
import '../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../naver_marker_controller.dart';

class NaverMapNavBar extends StatelessWidget {
  final int routeCase;
  const NaverMapNavBar({
    required this.routeCase,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<NaverMarkerController>(
        builder: (controller) =>
            Container(
              color: Style.white,
              height: controller.deviceHeight.value,
              padding: WidgetSize(context).paddingBodyWhole,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  !controller.isComplete.value
                      ? DisableButton(text: '지도 초기화 중')
                      :
                  controller.street.value != '' && controller.street.value != '인식 불가 지역이에요.' &&
                      controller.setDong.value != ''
                      ? NeumorphicButtons(text: '이 위치로 설정', onPressed: controller.onTapFinish(routeCase))
                      : DisableButton(text: '마커 위치를 이동해주세요.')
                ],
              ),
            ),
      ),
    );
  }
}
