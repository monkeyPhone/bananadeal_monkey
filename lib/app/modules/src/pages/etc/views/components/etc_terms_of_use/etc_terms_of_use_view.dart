import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_terms_of_use/widgets/etc_terms_of_use_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../components/custom_tap_bar.dart';

import '../../../../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import 'etc_terms_of_use_controller.dart';

class EtcTermsOfUseView extends GetView<EtcTermsOfUseController> {
  const EtcTermsOfUseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: Column(
          children: [
            BasicAppbar(title: Text('이용약관', style: TextStyle(color: Style.blackWrite, fontSize: WidgetSize(context).sizedBox24, fontWeight: FontWeight.w700),)),
            Expanded(
              child: Column(
                children: [
                  CustomTapBar3Button(
                    tabController: controller.tabController,
                    tap1: '서비스\n이용약관',
                    tap2: '개인정보\n취급방침',
                    tap3: '위치기반서비스\n이용약관',
                  ),
                  Expanded(
                    child: Container(
                      width: WidgetSize(context).widthCommon,
                      color: Style.greyF4F4F4,
                      padding: EdgeInsets.only(
                        top: WidgetSize(context).sizedBox16,
                        bottom: WidgetSize(context).sizedBox16,
                      ),
                      child: EtcTermsOfUseBody(),
                    ),
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
            color: Style.greyF4F4F4,
            child: SafeArea(child: SizedBox())));
  }
}
