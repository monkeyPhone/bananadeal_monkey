import 'package:flutter/material.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';

class InquiryListContainerResult extends StatelessWidget {
  final String status;
  const InquiryListContainerResult({
    required this.status,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(status == '처리중' ? '진행중' : '답변 완료',
      style: TextStyle(
        fontSize: WidgetSize(context).sizedBox14,
        fontWeight: FontWeight.w700,
        color: status == '처리중'
            ? Style.grey999999 : Style.red,
      ),
    );
  }
}
