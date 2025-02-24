import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/controller/reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../routes/const_element.dart';

class ReservationAppbar extends GetView<ReservationController> {
  const ReservationAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: WidgetSize(context).sizedBox16
      ),
      margin: EdgeInsets.symmetric(
          vertical: WidgetSize(context).sizedBox4
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            width: WidgetSize(context).sizedBox2,
            color: Style.grey999999
          )
        )
      ),
      height: WidgetSize(context).sizedBox45,
      width: WidgetSize(context).widthCommon,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppElement.iconBanana, width: WidgetSize(context).sizedBox10, height: WidgetSize(context).sizedBox20,),
          SizedBox(
            width: WidgetSize(context).sizedBox16,
          ),
         Expanded(
           child: ObxValue(
                   (name) =>
                       switch(name.value){
                        '' =>
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text('페이지 로드에 실패하였습니다.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: WidgetSize(context).sizedBox20,
                                  color: Style.blackWrite,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                        _ =>
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text('"${name.value}" 방문 예약',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: WidgetSize(context).sizedBox20,
                                  color: Style.blackWrite,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                       }
                       ,controller.storeName),
         ),
        ],
      ),
    );
  }
}
