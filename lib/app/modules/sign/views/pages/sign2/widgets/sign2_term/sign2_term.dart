import 'package:banana_deal_by_monkeycompany/app/components/future_builder_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar_text.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_term/sign2_term_body/sign2_term_body.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_term/sign2_term_body/sign2_term_body_top.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_term/sign2_term_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_term/sign2_term_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../css/size.dart';

class Sign2Term extends GetView<Sign2TermController> {
  const Sign2Term({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
      canPop: false,
      onPopInvoked: (bool didPop, Object? result) async{
        if(didPop){
          return;
        }
        controller.closeTerms();
      },
        body: Column(
          children: [
            BasicAppbar(
                leading: (){
                  controller.closeTerms();
                },
                title: BasicAppBarText22(text: '약관동의'),
            ),
            Expanded(
              child: ListView(
                controller: ScrollController(),
                physics: const ClampingScrollPhysics(),
                children: [
                  Sign2TermBodyTop(),
                  FutureBuilderWidgetNoExpanded(
                      future: controller.getTermsSign(),
                      nextWidget: Sign2TermBody()
                  ),
                  Sign2TermBodyBottom()
                ],
              ),
            ),
            SizedBox(
              height: WidgetSize(context).extendsGap,
            )
          ],
        ),
      bottomNavigationBar: Sign2TermNav(),
    );
  }
}
