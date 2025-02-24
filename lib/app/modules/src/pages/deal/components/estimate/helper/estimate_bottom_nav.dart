import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/estimate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../routes/const/const_info.dart';
import 'estimate_bottom_nav_state.dart';

class EstimateBottomNav extends GetView<EstimatedController> {

  const EstimateBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.karajeck,
      child: SafeArea(
        child: ObxValue((status)=>
            SizedBox(
              height: WidgetSize(context).height60px,
              child:
              status.value == InfoString.dealStatusIng
                  ? EstimateBottomNavState(
                currentDeal: controller.currentDeal,
              )
                  : Container(
                color: Style.greyButtonDisable,
                width: WidgetSize(context).widthCommon,
                height: WidgetSize(context).height60px,
                child: Center(
                    child: Text(
                      '${status.value}된 딜입니다.', style:
                    TextStyle(fontSize: WidgetSize(context).sizedBox18, color: Colors.grey[800], fontWeight: FontWeight.w500),
                    )



                ),
              )
              ,
            ),

            controller.estimateStatus),
      ),
    );
  }


}
