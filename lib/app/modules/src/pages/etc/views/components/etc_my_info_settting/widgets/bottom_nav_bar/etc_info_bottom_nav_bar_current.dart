import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/bottom_nav_bar/button_text_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../main/auth/auth_controller.dart';

class EtcInfoBottomNavBarCurrent extends GetView<EtcMyInfoSettingController> {
  const EtcInfoBottomNavBarCurrent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        RippleDecorationButton(
            onTap: () async{
              await AuthController.to.logout('로그아웃 버튼');
              },

            padding: EdgeInsets.all(
              WidgetSize(context).sizedBox16,
            ),
            widget: ButtonTextInfo(text: '로그아웃',)
        ),

        RippleDecorationButton(
            onTap: (){
              controller.clickQuickPush();
            },

            padding: EdgeInsets.all(
              WidgetSize(context).sizedBox16,
            ),
            widget: ButtonTextInfo(text: '탈퇴하기',)
        ),

      ],
    );
  }
}
