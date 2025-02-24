import 'package:flutter/material.dart';

import 'check_day.dart';

class CheckDayRoute extends StatelessWidget {
  final bool route;
  final String regdate;
  final bool? isDate;
  const CheckDayRoute({
    required this.route,
    required this.regdate,
    this.isDate,
    super.key});

  @override
  Widget build(BuildContext context) {

    return route
        ? CheckDay(regdate: regdate, isDate: isDate,)
        : SizedBox();
  }
}
