import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../routes/const_element.dart';
import '../../../../../views/widgets/start_deal/components/step_button.dart';
import '../../make_deal/controllers/make_deal_controller.dart';
import 'body2_controller.dart';

class Body2View extends GetView<Body2Controller> {
  const Body2View({Key? key}) : super(key: key);

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
                                      controller.onTapIndex2(context: context, index: index,);
                                    }
                                  : (){
                                      controller.onTapIndex(index);
                                    },
                                buttonColor: controller.check.value == index
                                                ? index == 2 && MakeDealController.to.currentAgency.value != '' && MakeDealController.to.currentAgency.value != '1' &&
                                                  MakeDealController.to.currentAgency.value != MakeDealController.to.check1Text[MakeDealController.to.currentStep.value]
                                                    ? Style.yellowCheck
                                                    : index == 1
                                                        ? Style.yellowCheck
                                                        : Style.white
                                                : Style.white,
                                buttonBorderColor: controller.check.value == index
                                    ? index == 2 && MakeDealController.to.currentAgency.value != '' && MakeDealController.to.currentAgency.value != '1' &&
                                    MakeDealController.to.currentAgency.value != MakeDealController.to.check1Text[MakeDealController.to.currentStep.value]
                                    ? Style.yellow
                                    : index == 1
                                    ? Style.yellow
                                    : Style.grey999999
                                    : Style.grey999999,
                                check: controller.check.value == index
                                    ? index == 2 && MakeDealController.to.currentAgency.value != '' && MakeDealController.to.currentAgency.value != '1' &&
                                    MakeDealController.to.currentAgency.value != MakeDealController.to.check1Text[MakeDealController.to.currentStep.value]
                                    ? AssetImageBox(imageHeight: WidgetSize(context).etcStep, imageWidth: WidgetSize(context).width0064, imageUrl: AppElement.checkImage)
                                    : index == 1
                                    ? AssetImageBox(imageHeight: WidgetSize(context).etcStep, imageWidth: WidgetSize(context).width0064, imageUrl: AppElement.checkImage)
                                    : SizedBox(height: WidgetSize(context).etcStep, width: WidgetSize(context).width0064,)
                                    : SizedBox(height: WidgetSize(context).etcStep, width: WidgetSize(context).width0064,),

                                buttonText: index == 2 && MakeDealController.to.currentAgency.value != '' && MakeDealController.to.currentAgency.value != '1' &&
                                            MakeDealController.to.currentAgency.value != MakeDealController.to.check1Text[MakeDealController.to.currentStep.value]
                                              ? MakeDealController.to.currentAgency.value
                                              : controller.checkText[index],
                                buttonTextColor: controller.check.value == index
                                    ? index == 2 && MakeDealController.to.currentAgency.value != '' && MakeDealController.to.currentAgency.value != '1' &&
                                    MakeDealController.to.currentAgency.value != MakeDealController.to.check1Text[MakeDealController.to.currentStep.value]
                                    ? Style.brown
                                    : index == 1
                                    ? Style.brown
                                    : Style.grey999999
                                    : Style.grey999999,
                              ),
                  ),
              ),

              // controller.check.value == 2
              // ?
              // NeumorphicButtons(text: MakeDealController.to.listButtonText[MakeDealController.to.currentStep.value], onPressed: (){
              //   MakeDealController.to.modalOnTap(context);
              // })
              //     :
              //     DisableButton(text: MakeDealController.to.listButtonText[MakeDealController.to.currentStep.value])
            ],
          ),
        ],
      );
    });
  }
}
