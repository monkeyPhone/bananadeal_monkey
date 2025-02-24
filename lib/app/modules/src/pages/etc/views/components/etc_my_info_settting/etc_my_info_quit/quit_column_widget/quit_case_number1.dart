import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../routes/const_element.dart';
import '../../../../../../deal/views/widgets/start_deal/components/step_button.dart';

class QuitCaseNumber1 extends StatelessWidget {
  const QuitCaseNumber1({super.key});

  @override
  Widget build(BuildContext context) {
    return  MediaQuery.of(context).viewInsets.bottom > 0
        ?
    SizedBox(
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).width016,
    )
        :
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ...List.generate(6,
              (index) =>
          index == 0
              ?
          SizedBox()
              :
          Container(
            margin: EdgeInsets.only(bottom: WidgetSize(context).sizedBox8),
            child: GetBuilder<EtcMyInfoSettingController>(
              builder: (controller) =>
                  StepButton(
                    onTap: (){
                      controller.changeCheck(index);
                    },
                    buttonColor: controller.check.value == index ? Style.yellowCheck : Style.white,
                    buttonBorderColor:  controller.check.value == index ? Style.yellow : Style.grey999999,
                    check: controller.check.value == index
                        ? AssetImageBox(imageHeight: WidgetSize(context).etcStep, imageWidth: WidgetSize(context).width0064, imageUrl: AppElement.checkImage)
                        : SizedBox(height: WidgetSize(context).etcStep, width: WidgetSize(context).width0064,),
                    buttonText: controller.stepYearList1[index],
                    buttonTextColor: controller.check.value == index ? Style.brown : Style.grey999999,
                  )
            ),
          ),
        ).toList(),
        SizedBox(
          height: WidgetSize(context).width016,
        )
      ],
    );
  }
}
