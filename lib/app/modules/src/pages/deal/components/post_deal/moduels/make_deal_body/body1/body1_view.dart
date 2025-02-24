import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../routes/const_element.dart';
import '../../../../../views/widgets/start_deal/components/step_button.dart';
import 'body1_controller.dart';

class Body1View extends GetView<Body1Controller> {
  const Body1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObxValue((click) =>
        ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...List.generate(
                    controller.stepYearList1.length, (index) =>
                index == 0 ?
                SizedBox()
                    :
                Padding(
                  padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox12),
                  child: StepButton(
                    onTap: (){
                      controller.checkTap(index);
                    },
                    buttonColor: click.value == index ? Style.yellowCheck : Style.white,
                    buttonBorderColor:  click.value == index ? Style.yellow : Style.grey999999,
                    check: click.value == index
                        ? AssetImageBox(imageHeight: WidgetSize(context).etcStep, imageWidth: WidgetSize(context).width0064, imageUrl: AppElement.checkImage)
                        : SizedBox(height: WidgetSize(context).etcStep, width: WidgetSize(context).width0064,),
                    buttonText: controller.stepYearList1[index],
                    buttonText2: controller.stepYearList2[index],
                    buttonTextColor: click.value == index ? Style.brown : Style.grey999999,
                  ),
                )
                ).toList()
              ],
            ),
          ],
        )
        , controller.check
    );
  }
}
