import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:flutter/material.dart';

import '../../../../../../../css/style.dart';

class ReservationAlertMessage extends StatelessWidget {
  const ReservationAlertMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: WidgetSize(context).sizedBox8,
        bottom: WidgetSize(context).sizedBox12
      ),
      child: SizedBox(
        width: WidgetSize(context).widthCommon,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: WidgetSize(context).sizedBox8,
            ),
            Text('딜 수락 시 방문 정보가 판매자에게 전달되며,\n진행중인 다른 견적은 자동 종료됩니다.',
              style: TextStyle(
                color: Colors.lightGreen,
                fontSize: WidgetSize(context).sizedBox18,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: WidgetSize(context).sizedBox6,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: WidgetSize(context).sizedBox16,
              ),
              child: Text('※ 매장 방문 후 개통전까지는 자유롭게 취소가\n가능하오니 부담없이 방문하세요.',
                style: TextStyle(
                    color: Style.blackWrite,
                    fontSize: WidgetSize(context).sizedBox15,
                    fontWeight: FontWeight.w400
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
