import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_detail/helper/etc_event_detail_body.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../../../../../css/style.dart';


class EtcEventDetailView extends StatelessWidget{
  final int eventIdx;
  final String email;
  const EtcEventDetailView({
    required this.eventIdx,
    required this.email,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BasicCanvas(
        canPop: true,
        body: EtcEventDetailBody(eventIdx: eventIdx, email: email,),
        bottomNavigationBar: Container(
          color: Style.greyF4F4F4,
          child: SafeArea(
            child: SizedBox(),
          ),
        )
    );
  }
}
