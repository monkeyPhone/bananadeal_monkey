import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';

class InquiryListContainerTime extends StatelessWidget {
  final String date;
  const InquiryListContainerTime({
    required this.date,
    super.key});

  @override
  Widget build(BuildContext context) {
    DateTime form = DateTime.parse(date).toLocal();
    var allTime = DateFormat("yyyy.MM.dd").format(form);
    return Text(allTime, style: TextStyle(color: Style.grey999999, fontSize: WidgetSize(context).etcTimeSize, fontWeight: FontWeight.w400),);
  }
}
