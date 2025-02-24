import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/widgets/bottom_nav/inquiry_send_bottom_button.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../routes/const_element.dart';

class InquirySendBottomNav extends StatelessWidget {
  const InquirySendBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
          child:
          SizedBox(
            width: WidgetSize(context).widthCommon,
            height: AppElement.defaultBottomPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InquirySendBottomButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
