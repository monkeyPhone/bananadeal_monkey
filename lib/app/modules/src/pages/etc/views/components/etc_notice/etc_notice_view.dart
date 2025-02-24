import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_notice/components/etc_notice_body/etc_notice_body.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_notice/components/etc_notice_navbar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_notice/etc_notice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../css/app_basic_component/basic_app_bar_text.dart';



class EtcNoticeView extends GetView<EtcNoticeController> {

  const EtcNoticeView({

    Key? key}) : super(key: key);

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
              leading: controller.leading,
              title: BasicAppBarText(
                text: '공지사항',
              ),
            ),
            Expanded(
                child: EtcNoticeBody(),
            )
          ],
        ),
        bottomNavigationBar: EtcNoticeNavBar()
    );
  }

}
