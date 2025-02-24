import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class EtcEvnetListContainerTime extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;
  const EtcEvnetListContainerTime({
    required this.startTime,
    required this.endTime,
    super.key});

  @override
  Widget build(BuildContext context) {
    DateTime start = startTime.toLocal();
    DateTime end = endTime.toLocal();
    var allStart = DateFormat("yyyy.MM.dd").format(start);
    var allEnd = DateFormat("yyyy.MM.dd").format(end);
    return Text('$allStart~$allEnd',
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: WidgetSize(context).etcTimeSize,
          color: Style.grey999999
      ),
    );
  }
}
