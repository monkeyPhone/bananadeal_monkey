import 'package:banana_deal_by_monkeycompany/app/components/future_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../css/style.dart';
import '../../controllers/deep_link_event_controller.dart';
import 'guest_event_detail_column.dart';

class LinkEventView extends GetView<DeepLinkEventController> {
  final int idx;
  const LinkEventView({
    super.key,
    required this.idx,
   });

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: FutureBuilderWidget(
          future:  controller.getEventDetail(eventIdx: idx),
          nextWidget: GuestEventDetailColumn(
            eventIdx: idx,
          ),

        ),
        bottomNavigationBar: Container(
          color: Style.greyF4F4F4,
          child: SafeArea(
            child: SizedBox(),
          ),
        )
    );
  }
}
