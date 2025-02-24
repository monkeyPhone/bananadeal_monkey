import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_detail/components/widgets/event_detail_notice.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_detail/components/widgets/evet_detail_colum_button_route.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../models/etc/etc_event_detail.dart';


class EventDetailColumButton extends StatelessWidget {
  final int beIdx;
  final EtcEventDetailResult eventDetail;
  const EventDetailColumButton({
    required this.beIdx,
    required this.eventDetail,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
      child: Column(
        children: [
          SizedBox(
            height: WidgetSize(context).sizedBox16,
          ),
          EventDetailColumButtonRoute(beIdx: beIdx, eventDetail: eventDetail,),
          SizedBox(
            height: WidgetSize(context).sizedBox16,
          ),
          EventDetailNotice(beNotice: eventDetail.beNotice),

        ],)
    );
  }

}
