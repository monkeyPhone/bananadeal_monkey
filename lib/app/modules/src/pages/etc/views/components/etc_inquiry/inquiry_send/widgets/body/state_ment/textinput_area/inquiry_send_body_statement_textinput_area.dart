import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/widgets/body/state_ment/normal_text.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/widgets/body/state_ment/textinput_area/inquiry_send_header_input.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../../css/size.dart';
import 'inquiry_send_content_input.dart';

class InquirySendBodyStatementTextInputArea extends StatelessWidget {
  final String header;
  final String content;
  const InquirySendBodyStatementTextInputArea({
    required this.header,
    required this.content,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalText(text: '제목'),
          SizedBox(height: WidgetSize(context).sizedBox12),
          InquirySendHeaderInput(header: header),
          SizedBox(height: WidgetSize(context).sizedBox16),
          NormalText(text: '내용'),
          SizedBox(height: WidgetSize(context).sizedBox12),
          InquirySendContentInput(content: content,)
        ],
      ),
    );;
  }
}
