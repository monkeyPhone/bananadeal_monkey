import 'package:flutter/material.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../../../../../models/nav/deal/deal_status.dart';

class EstimateAppbarText extends StatelessWidget {
  final DealStatusList currentDeal;
  const EstimateAppbarText({
    required this.currentDeal,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      currentDeal.diHopePhone == '프리미엄폰' || currentDeal.diHopePhone == '보급폰' ||
          currentDeal.diHopePhone == '효도폰' || currentDeal.diHopePhone == '공부폰' || currentDeal.diHopePhone == '어린이폰'
          ?  '추천 단말기'
          :  currentDeal.diHopePhone,
      style: currentDeal.diHopePhone.length > 25
              ? TextStyle(
          fontSize: WidgetSize(context).sizedBox16,
          fontWeight: FontWeight.w700,
          color: Style.blackWrite
      )
              : currentDeal.diHopePhone.length > 20
                  ? TextStyle(
          fontSize: WidgetSize(context).sizedBox18,
          fontWeight: FontWeight.w700,
          color: Style.blackWrite
      )
                  : TextStyle(
          fontSize: WidgetSize(context).sizedBox22,
          fontWeight: FontWeight.w700,
          color: Style.blackWrite
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
