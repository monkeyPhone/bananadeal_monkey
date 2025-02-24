import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../components/custom_tap_bar.dart';
import '../../../../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import 'etc_event_controller.dart';
import 'widgets/etc_event_main.dart';

class EtcEventView extends GetView<EtcEventController> {
  const EtcEventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: Column(
          children: [
            BasicAppbar(title: Text('이벤트', style: TextStyle(color: Style.blackWrite, fontSize: WidgetSize(context).sizedBox24, fontWeight: FontWeight.w700),)),
            Expanded(
              child: Column(
                children: [
                  CustomTapBar(
                    tabController: controller.tabController,
                    tap1: '진행중인 이벤트',
                    tap2: '종료된 이벤트',
                  ),
                  Expanded(
                    child: Container(
                        width: WidgetSize(context).widthCommon,
                        color: Style.white,
                        child: EtcEventMain()),
                  ),
                  SizedBox(
                    height: WidgetSize(context).extendsGap,
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
            color: Style.white,
            child: SafeArea(child: SizedBox())));
  }
}
