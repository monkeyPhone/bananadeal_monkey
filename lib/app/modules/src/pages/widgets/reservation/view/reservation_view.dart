import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/view/widgets/reservation_route/reservation_route_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../models/nav/deal/deal_estimate.dart';

class ReservationView extends StatelessWidget {
  final DealEstimateList? estimate;
  final int joinTkIdx;
  const ReservationView({
    super.key,
    required this.estimate,
    required this.joinTkIdx,
  });

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: false,
        onPopInvoked: (bool didPop, Object? result){
          if(didPop){
            return;
          }
          Get.back();
          estimate != null ? Get.back() : null;
        },
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();// 키보드 닫기 이벤트
          },
          child: ReservationRouteView(estimate: estimate, joinTkIdx: joinTkIdx,)
        )
    );
  }
}
