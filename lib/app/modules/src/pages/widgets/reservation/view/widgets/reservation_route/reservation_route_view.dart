import 'package:banana_deal_by_monkeycompany/app/components/loading.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/controller/reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../models/nav/deal/deal_estimate.dart';
import '../reservation_agree.dart';
import '../reservation_alert_grey/reservation_alert_grey.dart';
import '../reservation_alert_grey/reservation_alert_red.dart';
import '../reservation_alert_message.dart';
import '../reservation_appbar.dart';
import '../reservation_calender_area.dart';
import '../reservation_form/reservation_form_area.dart';
import '../reservation_last_button_area.dart';

class ReservationRouteView extends GetView<ReservationController> {
  final DealEstimateList? estimate;
  final int joinTkIdx;
  const ReservationRouteView({super.key,
    required this.joinTkIdx,
    required this.estimate,
  });

  @override
  Widget build(BuildContext context) {
    return ObxValue((name) =>
        name.value == ''
            ?
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReservationAppbar(),
              Expanded(child: DefaultView(text1: '잠시 후, 다시 시도해주세요.', text2: '')),
              ReservationLastButtonArea(estimate: estimate)
            ],
          ),
        )
            :
        Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: SizedBox(
              width: WidgetSize(context).widthCommon,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReservationAppbar(),
                      ReservationAlertMessage(),
                      ReservationFormArea(),
                      ReservationAlertGrey(joinTkIdx: joinTkIdx,),
                      ReservationCalenderArea(),
                      ReservationAlertRed(),
                      ReservationAgree(),
                      ReservationLastButtonArea(estimate: estimate)
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
        , controller.storeName);
  }
}
