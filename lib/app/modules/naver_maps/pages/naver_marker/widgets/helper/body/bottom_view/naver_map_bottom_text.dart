import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/components/map_content_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../naver_marker_controller.dart';

class NaverMapBottomText extends GetView<NaverMarkerController> {
  const NaverMapBottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (adr) =>
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    adr.value == ''
                        ? MapContentText(text: '${controller.error.value}')
                        : adr.value == '인식 불가 지역이에요.'
                            ? MapContentText(text: '인식 실패 : 마커를 이동시켜 주세요.')
                            : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: WidgetSize(context).sizedBox6,
                                        horizontal: WidgetSize(context).sizedBox8
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: WidgetSize(context).sizedBox2,
                                            color: Style.yellow
                                        ),
                                        borderRadius: BorderRadius.circular(999)
                                    ),
                                    child: MapContentText(
                                      text: '현재위치',
                                      textColor: Style.brown ,
                                      fontSize: WidgetSize(context).sizedBox15,
                                    ),
                                  ),
                                  SizedBox(width: WidgetSize(context).sizedBox14,),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MapContentText(text: '${adr.value}', fontSize: WidgetSize(context).sizedBox19,)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                  ],
                )
        ,controller.street);
  }
}
