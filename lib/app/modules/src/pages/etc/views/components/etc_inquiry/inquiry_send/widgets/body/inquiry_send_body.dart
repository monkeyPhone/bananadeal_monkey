import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/widgets/body/inquiry_send_body_button_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/widgets/body/state_ment/inquiry_send_body_statement.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../css/size.dart';


class InquirySendBody extends StatelessWidget {
  const InquirySendBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InquirySendBodyButtonArea(),
        SizedBox(height: WidgetSize(context).sizedBox24),
        InquirySendBodyStatement(),
        SizedBox(height: WidgetSize(context).sizedBox18),
      ],
    );
  }
}
