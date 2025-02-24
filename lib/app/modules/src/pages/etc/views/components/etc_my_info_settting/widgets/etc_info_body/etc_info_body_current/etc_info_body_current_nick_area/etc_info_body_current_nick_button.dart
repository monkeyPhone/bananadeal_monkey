import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/components/info_row_update_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_body/etc_info_body_current/etc_info_body_current_nick_area/nickname_change_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../css/size.dart';

class EtcInfoBodyCurrentNickButton extends GetView<EtcMyInfoSettingController> {
  final String name;
  const EtcInfoBodyCurrentNickButton({
    required this.name,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (p0) =>
                InfoRowUpdateButton(
                  onTap:
                  p0.value
                      ? (){}
                      : (){
                    NickNameChangeDialog().nickDialog(routerContext: context, name: name);
                  },
                  text: '수정',
                  height: WidgetSize(context).sizedBox37,
                  width: WidgetSize(context).sizedBox62,
                )
        , controller.crop);
  }
}
