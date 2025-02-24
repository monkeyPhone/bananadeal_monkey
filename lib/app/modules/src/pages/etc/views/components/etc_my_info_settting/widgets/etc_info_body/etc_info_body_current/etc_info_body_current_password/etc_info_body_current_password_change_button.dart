import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_my_info_setting_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_body/etc_info_body_current/etc_info_body_current_password/password_change_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../components/info_row_update_button.dart';

class EtcInfoBodyCurrentPasswordChangeButton extends GetView<EtcMyInfoSettingController> {
  const EtcInfoBodyCurrentPasswordChangeButton({super.key});

  @override
  Widget build(BuildContext context) {

    return ObxValue(
            (p0) =>
                InfoRowUpdateButton(
                  onTap: p0.value
                            ? (){}
                            : (){
                                PasswordChangeDialog().passDialog(context);
                              },
                  text: '변경하기',
                  width: WidgetSize(context).sizedBox100+WidgetSize(context).sizedBox16,
                  height: WidgetSize(context).sizedBox40,
                )
        , controller.crop);
  }



}
