import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/widgets/body/inquiry_send_body.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/widgets/bottom_nav/inquiry_send_bottom_nav.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../../css/app_basic_component/basic_app_bar_text.dart';

class InquirySendView extends StatelessWidget {
  const InquirySendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: BasicCanvas(
          canPop: true,
          body: Column(
            children: [
              BasicAppbar(
                  title: BasicAppBarText(
                    text: '1:1 문의',
                  )
              ),
             Expanded(
               child: ListView(
                 children: [
                   InquirySendBody()
                 ],
               ),
             )
            ],
          ),
          bottomNavigationBar: InquirySendBottomNav()
      ),
    );
  }

}
