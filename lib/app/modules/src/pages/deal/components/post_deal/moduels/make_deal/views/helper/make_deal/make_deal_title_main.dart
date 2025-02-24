import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/controllers/make_deal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../css/app_basic_component/basic_back_button.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import '../../../../../../../views/widgets/custom_progress_indicator.dart';

class MakeDealTitleMain extends GetView<MakeDealController> {
  final int page;
  const MakeDealTitleMain({
    required this.page,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: WidgetSize(context).sizedBox10,),
        SizedBox(
          width: WidgetSize(context).widthCommon,
          height: WidgetSize(context).height60px,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '새로운 딜 만들기',
                style: TextStyle(
                    color: Style.blackWrite,
                    fontSize: WidgetSize(context).sizedBox24,
                    fontWeight: FontWeight.w700),
              ),
              BasicCloseButton(
                onTap: (){
                  controller.quitDeal(context);
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: WidgetSize(context).sizedBox20,
        ),
        StepProgressIndicator(
          totalSteps: 9,
          currentStep: page,
          padding: 0.01,
          unselectedColor: Style.greyD9D9D9,
          selectedColor: Style.yellow,
          size: WidgetSize(context).sizedBox22,
          roundedEdges: Radius.circular(WidgetSize(context).widthCommon),
        )
      ],
    );
  }
}
