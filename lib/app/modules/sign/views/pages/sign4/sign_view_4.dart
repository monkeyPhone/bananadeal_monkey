import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign4/widgets/sign4_app_bar/sign4_appbar_actions.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign4/widgets/sign4_body/sign4_current_page.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign4/widgets/sign4_bottom/sign_4_bottom_nav_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../css/size.dart';
import '../../../../../css/style.dart';
import '../../../controllers/sign_view_3_controller.dart';
import '../../../controllers/sign_view_4_controller.dart';


class SignView4 extends GetView<SignView4Controller> {
  const SignView4({
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          controller.focus.unfocus();
        },
        child: BasicCanvas(
          canPop: true,
          body: Column(
            children: [
              BasicAppbar2(
                lotation: false,
                actions:  Sign4AppbarActions(),
              ),
              Expanded(
                child: Padding(
                    padding: WidgetSize(context).paddingBodyWhole,
                    child: Sign4CurrentPage(mediaContext: context,)
                ),
              ),

            ],
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              color: Style.white,
              padding: WidgetSize(context).paddingBodyWhole,
              height: SignView3Controller.to.deviceHeight.value,
              child: Sign4BottomNavColumn(),
            ),
          ),
        )
    );
  }
}
