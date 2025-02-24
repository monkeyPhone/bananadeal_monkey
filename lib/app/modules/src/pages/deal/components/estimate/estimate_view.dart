import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'estimate_controller.dart';
import 'helper/appbar/estimate_app_bar_area.dart';


class EstimateView extends GetView<EstimatedController> {
  final int diIdx;
  const EstimateView({
    Key? key,
    required this.diIdx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: Column(
          children: [
            // _BackGround(),
            EstimateAppbarArea(diIdx: diIdx,),
            Expanded(
              child: Estimate() ,
            )
            //estimateBody(),
          ],
        ),
        //),
        bottomNavigationBar: EstimateBottomNav()
    );

  }
}


// class _BackGround extends StatelessWidget {
//   const _BackGround();
//
//   @override
//   Widget build(BuildContext context) {
//     return AppConfig.baseIsIos == true
//         ? EstimateBackground()
//         : SizedBox();
//   }
// }
