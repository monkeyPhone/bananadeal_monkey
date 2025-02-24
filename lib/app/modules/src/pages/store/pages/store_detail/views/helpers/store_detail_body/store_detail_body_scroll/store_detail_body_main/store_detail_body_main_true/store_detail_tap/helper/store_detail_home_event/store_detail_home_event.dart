import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_tap/helper/store_detail_home_event/store_detail_home_event_area.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../../css/size.dart';

class StoreDetailHomeEvent extends StatelessWidget {
  final List storeEvent;
  final List storeIcon;
  const StoreDetailHomeEvent({
    required this.storeEvent,
    required this.storeIcon,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('매장 이벤트', style: TextStyle(
            fontSize: WidgetSize(context).sizedBox18,
            fontWeight: FontWeight.w700
        ),),
        SizedBox(height: WidgetSize(context).sizedBox14),
        StoreDetailHomeEventArea(storeEvent: storeEvent, storeIcon: storeIcon,)
      ],
    );
  }
}
