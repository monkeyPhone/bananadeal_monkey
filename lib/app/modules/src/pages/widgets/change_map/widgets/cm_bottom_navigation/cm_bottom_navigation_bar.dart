import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../components/disable_button.dart';
import '../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../change_map_controller.dart';
import '../result_area_components/text_widget.dart';

class CmBottomNavigationBar extends StatelessWidget {
  const CmBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeMapController>
      (builder: (controller){
        return controller.rangeChange.value
                  ?  Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         controller.currentRange.value == 0
                            ? const DisableButton(text: '위치 범위를 선택해주세요')
                            : NeumorphicButtons(
                                  text: '설정 완료',
                                  onPressed: () async{
                                    await controller.changeMessage(range: controller.currentRange.value);
                                   }
                                  )
                       ],
                     )
                  :  Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         if(controller.addressInfo.value.results.juso.isEmpty && controller.res.value == '')
                           const SizedBox(),
                         if(controller.addressInfo.value.results.juso.isNotEmpty && controller.res.value == '' && controller.longtitude.value == '' && controller.latitude.value == '' && controller.dong.value == '' && controller.addr.value == '')
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               RippleIconButton(
                                 onTap: () async{
                                   await controller.countMinus(context);
                                 },
                                 iconSize: WidgetSize(context).sizedBox40,
                                 icon: Icons.arrow_back_ios,
                                 iconColor: controller.currentPage.value == 1 ? Style.greyButtonDisable : Style.brown,
                               ),
                               Row(
                                 children: [
                                   Text('${controller.currentPage.value.toString()} ', style: TextStyle(
                                     fontSize: WidgetSize(context).sizedBox20,
                                     color: controller.currentPage.value == (int.parse(controller.addressInfo.value.results.common.totalCount)/20).ceil()
                                              ? Style.brown
                                              : Style.greyWrite,
                                     fontWeight: FontWeight.w700,
                                    ),
                                   ),
                                   RoadTextBrownBigBold(text: '  /   ${(int.parse(controller.addressInfo.value.results.common.totalCount)/20).ceil()}'),
                                 ],
                               ),
                               RippleIconButton(
                                 onTap: () async{
                                   await controller.countPlus(context);
                                 },
                                 iconSize: WidgetSize(context).sizedBox40,
                                 icon: Icons.arrow_forward_ios,
                                 iconColor: controller.currentPage.value >= int.parse(controller.addressInfo.value.results.common.totalCount)/20
                                     ? Style.greyButtonDisable
                                     : Style.brown,
                               ),
                             ],
                           ),
                         controller.longtitude.value == '' && controller.latitude.value == '' && controller.dong.value == '' && controller.addr.value == ''
                             ?  const SizedBox()
                             :  NeumorphicButtons(
                                     text: '저장하기',
                                onPressed: () async{
                                      if(Get.isSnackbarOpen){
                                        Get.back();
                                      } else{
                                        await controller.getMessage();
                                        }
                                      }
                                    )

                       ],
                      );
      }
    );

  }
}
