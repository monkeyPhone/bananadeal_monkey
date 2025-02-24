import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../routes/const_element.dart';
import '../../../../../views/widgets/start_deal/components/step_button.dart';
import '../../make_deal/controllers/make_deal_controller.dart';
import 'body5_controller.dart';

class Body5View extends GetView<Body5Controller> {
  const Body5View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MakeDealController.to.joinerPhoneRecList.isEmpty
              ? SizedBox()
              : ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...List.generate(
                            MakeDealController.to.joinerPhoneRecList.length, (index) =>
                        index == 0
                            ? SizedBox()
                            : Padding(
                                padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox12),
                                child: StepButton(
                                  onTap: (){
                                    controller.body5OnTap(index);
                                    },
                                  buttonColor: controller.check.value == index
                                                  ? Style.yellowCheck
                                                  : Style.white,
                                  buttonBorderColor:  controller.check.value == index
                                                        ? Style.yellow
                                                        : Style.grey999999,
                                  check: controller.check.value == index
                                            ? AssetImageBox(imageHeight: WidgetSize(context).etcStep, imageWidth: WidgetSize(context).width0064, imageUrl: AppElement.checkImage)
                                            : SizedBox(height: WidgetSize(context).etcStep, width: WidgetSize(context).width0064,),
                    buttonText: MakeDealController.to.joinerPhoneRecList[index],
                    buttonTextColor: controller.check.value == index ? Style.brown : Style.grey999999,
                  ),
                )
                ).toList()
              ],
            ),
          ],
        );
    }
    );
  }
}
