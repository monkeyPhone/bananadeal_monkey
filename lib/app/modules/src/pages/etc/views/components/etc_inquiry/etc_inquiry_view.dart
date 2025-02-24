import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/inquiry_body/inquiry_body.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/inquiry_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../css/app_basic_component/basic_app_bar_text.dart';
import 'etc_inquiry_controller.dart';
import 'helper/inquiry_nav_bar.dart';

class EtcInQuiryView extends GetView<EtcInquiryController> {
  const EtcInQuiryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BasicCanvas(
        canPop: false,
        onPopInvoked: (bool didPop, Object? result){
          if(didPop){
            return;
          }
          controller.leading();
        },
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BasicAppbar(
              leading: (){
                controller.leading();
              },
              title: BasicAppBarText(
                text: '1:1 문의',
              ),
            ),
            Expanded(
                child: InquiryBody(),
            )
          ],
        ),
        floatingActionButton: InquiryFloatingActionButton(),
        bottomNavigationBar: InquiryNavBar()
    );
  }

}
