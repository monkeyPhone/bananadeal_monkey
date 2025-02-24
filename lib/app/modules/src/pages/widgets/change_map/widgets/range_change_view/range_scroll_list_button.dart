import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/change_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../routes/const_element.dart';
import '../../../../deal/views/widgets/start_deal/components/step_button.dart';

class RangeScrollListButton extends GetView<ChangeMapController> {
  const RangeScrollListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: WidgetSize(context).sizedBox12,
          ),
          GetBuilder<ChangeMapController>(
              builder: (cmC){
                return Column(
                  children: List.generate(cmC.rangeList.length, (index) =>
                      Padding(
                        padding: EdgeInsets.only(top: WidgetSize(context).sizedBox12),
                        child: StepButton(
                          onTap: (){
                            cmC.clickRangeButton(cmC.rangeList[index]);
                          },
                          buttonColor: cmC.currentRange.value == cmC.rangeList[index]
                              ?  Style.yellowCheck
                              :  Style.white,
                          buttonBorderColor:  cmC.currentRange.value == cmC.rangeList[index]
                              ? Style.yellow
                              : Style.grey999999,
                          check: cmC.currentRange.value == cmC.rangeList[index]
                              ? AssetImageBox(imageHeight: WidgetSize(context).sizedBox22, imageWidth: WidgetSize(context).sizedBox28,
                              imageUrl: AppElement.checkImage)
                              : SizedBox(height: WidgetSize(context).sizedBox22, width: WidgetSize(context).sizedBox28,),
                          buttonText: '${cmC.rangeList[index]} km',
                          buttonTextColor: cmC.currentRange.value == cmC.rangeList[index]
                              ? Style.brown
                              : Style.grey999999,
                        ),
                      )
                  ).toList(),
                );
              }
          )
        ],
      ),
    );
  }
}
