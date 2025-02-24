import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../routes/const_element.dart';
import '../../../../../views/widgets/start_deal/components/step_button.dart';
import '../../make_deal/controllers/make_deal_controller.dart';
import 'body3_controller.dart';

class Body3View extends GetView<Body3Controller> {
  const Body3View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...List.generate(3, (index) =>
              index == 0
                  ? SizedBox()
                  : Padding(
                      padding: EdgeInsets.only(bottom: WidgetSize(context).dealPad, ),
                      child: StepButton(
                                onTap:  index == 2
                                          ? (){
                                              controller.body3OntapIndex2(context: context, index: index);
                                            }
                                          : (){
                                              controller.body3OntapIndex(index);
                                            },
                                buttonColor: controller.check.value == index
                                                ? index == 2 && MakeDealController.to.requestAgency.value != '' && MakeDealController.to.requestAgency.value != '1'
                                                   && MakeDealController.to.requestAgency.value != MakeDealController.to.check1Text[MakeDealController.to.currentStep.value]
                                                        ? Style.yellowCheck
                                                        : index == 1
                                                            ? Style.yellowCheck
                                                            : Style.white
                                                : Style.white,
                                buttonBorderColor: controller.check.value == index
                                                    ? index == 2 && MakeDealController.to.requestAgency.value != '' && MakeDealController.to.requestAgency.value != '1'
                                                      && MakeDealController.to.requestAgency.value != MakeDealController.to.check1Text[MakeDealController.to.currentStep.value]
                                                      ? Style.yellow
                                                      : index == 1
                                                            ? Style.yellow
                                                            : Style.grey999999
                                                    : Style.grey999999,
                                check: controller.check.value == index
                                          ? index == 2 && MakeDealController.to.requestAgency.value != '' && MakeDealController.to.requestAgency.value != '1'
                                            && MakeDealController.to.requestAgency.value != MakeDealController.to.check1Text[MakeDealController.to.currentStep.value]
                                              ? AssetImageBox(imageHeight: WidgetSize(context).etcStep, imageWidth: WidgetSize(context).width0064, imageUrl: AppElement.checkImage)
                                              : index == 1
                                                  ? AssetImageBox(imageHeight: WidgetSize(context).etcStep, imageWidth: WidgetSize(context).width0064, imageUrl: AppElement.checkImage)
                                                  : SizedBox(height: WidgetSize(context).etcStep, width: WidgetSize(context).width0064,)
                                          : SizedBox(height: WidgetSize(context).etcStep, width: WidgetSize(context).width0064,),
                                buttonText: index == 2 && MakeDealController.to.requestAgency.value != '' && MakeDealController.to.requestAgency.value != '1'
                                              && MakeDealController.to.requestAgency.value != MakeDealController.to.check1Text[MakeDealController.to.currentStep.value]
                                              ? MakeDealController.to.requestAgency.value
                                              : controller.checkText[index],
                                buttonTextColor: controller.check.value == index
                                                   ? index == 2 && MakeDealController.to.requestAgency.value != '' && MakeDealController.to.requestAgency.value != '1'
                                                     && MakeDealController.to.requestAgency.value != MakeDealController.to.check1Text[MakeDealController.to.currentStep.value]
                                                        ? Style.brown
                                                        : index == 1
                                                            ? Style.brown
                                                            : Style.grey999999
                                                   : Style.grey999999,
                                ),
                  ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
