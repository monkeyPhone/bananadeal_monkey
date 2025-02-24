import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_profile/time/helper/profile_time_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../../../models/store/store_detail_info.dart';
import 'helper/profile_timer_pad.dart';


class StoreDetailProfileTime extends StatelessWidget {
  final StoreDetail storeDetail;
  final String textString;
  final bool isOpen;
  const StoreDetailProfileTime({
    required this.storeDetail,
    required this.textString,
    required this.isOpen,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: WidgetSize(context).sizedBox20,
      child: storeDetail.smTimeStart == '' || storeDetail.smTimeEnd == ''
          ? ProfileTimeText(text: '상담시간 미등록', fontColor: Style.ultimateGrey,)
          :
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.access_time_outlined, size: WidgetSize(context).width004, color: Style.grey666666,),
          ProfileTimerPad(),
          ProfileTimeText(text: '${textString}', fontColor: Style.karajeck, fontWeight: FontWeight.w500,),
          ProfileTimerPad(),
          ProfileTimeText(text: '${storeDetail.smTimeStart}', fontColor: Style.ultimateGrey, fontWeight: FontWeight.w400,),
          ProfileTimerPad(pad: WidgetSize(context).sizedBox2,),
          ProfileTimeText(text: '~', fontColor: Style.ultimateGrey, fontWeight: FontWeight.w400,),
          ProfileTimerPad(pad: WidgetSize(context).sizedBox2,),
          ProfileTimeText(text: '${storeDetail.smTimeEnd}', fontColor: Style.ultimateGrey, fontWeight: FontWeight.w400,),
          ProfileTimerPad(pad: WidgetSize(context).width002,),
          isOpen
              ? ProfileTimeText(text: '지금 상담 가능')
              : ProfileTimeText(text: '상담 종료', fontColor: Style.ultimateGrey,),
        ],
      ),
    );
  }

}
