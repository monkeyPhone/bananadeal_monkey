import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/components/info_row_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/components/info_row_widget_com.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../models/auth/init_list.dart';

class EtcInfoBodyCurrentSrcInfoDetail extends StatelessWidget {
  final InfoMember infoM;
  const EtcInfoBodyCurrentSrcInfoDetail({
    required this.infoM,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  infoM.mJoinType == 'MAIL'
        ? InfoRowWidget(
            row: InfoRowWidgetCom(
              text1: '이메일',
              text2: infoM.mEmail,
            )
          )
        : InfoRowWidget(
            row: InfoRowWidgetCom(
              text1: 'SNS',
              text2: infoM.mJoinType
            )
    );
  }
}
