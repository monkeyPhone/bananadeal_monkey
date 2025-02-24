import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_tap/helper/store_detail_home_event/store_detail_home_event_area_list.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../../css/style.dart';

class StoreDetailHomeEventArea extends StatelessWidget {
  final List storeEvent;
  final List storeIcon;
  const StoreDetailHomeEventArea({
    required this.storeEvent,
    required this.storeIcon,
    super.key});

  @override
  Widget build(BuildContext context) {
    return storeEvent.first == '' &&  storeIcon.first == ''
        ?
    Center(
      child: SizedBox(
        width: WidgetSize(context).width09,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox7_5)),
          elevation: WidgetSize(context).sizedBox4,
          surfaceTintColor: Style.white,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: WidgetSize(context).sizedBox16,
                  vertical: WidgetSize(context).sizedBox16
              ),
              child: Text('해당 매장에서 진행중인 이벤트가 없습니다.',
                style: TextStyle(
                    color: Style.ultimateGrey,
                    fontSize: WidgetSize(context).sizedBox18,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
        ),
      ),
    )
        :
        StoreDetailHomeEventAreaList(storeEvent: storeEvent, storeIcon: storeIcon);
  }
}
