import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/components/info_row_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/components/info_row_widget_com.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_body/etc_info_body_current/etc_info_body_current_password/etc_info_body_current_password_change_button.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../models/auth/init_list.dart';

class EtcInfoBodyCurrentPasswordChange extends StatelessWidget {
  final InfoMember infoM;
  const EtcInfoBodyCurrentPasswordChange({
    required this.infoM,
    super.key});

  @override
  Widget build(BuildContext context) {
    return infoM.mJoinType == 'MAIL'
            ? InfoRowWidget(
                row: InfoRowWidgetCom(
                  text1: '비밀번호',
                  button: EtcInfoBodyCurrentPasswordChangeButton(),
                )
              )
          : SizedBox();
  }
}
