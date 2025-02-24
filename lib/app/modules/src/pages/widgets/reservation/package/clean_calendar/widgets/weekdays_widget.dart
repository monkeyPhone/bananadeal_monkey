import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/package/clean_calendar/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../controllers/simple_calendar_controller.dart';
import '../utils/enums.dart';

class WeekdaysWidget extends StatelessWidget {
  final bool showWeekdays;
  final SimpleCalendarController simpleCalendarController;
  final String locale;
  final Layout? layout;
  final TextStyle? textStyle;
  final Widget Function(BuildContext context, String weekday)? weekdayBuilder;

  const WeekdaysWidget({
    Key? key,
    this.showWeekdays = true,
    required this.simpleCalendarController,
    required this.locale,
    required this.layout,
    required this.weekdayBuilder,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!showWeekdays) return const SizedBox.shrink();

    return GridView.count(
      crossAxisCount: DateTime.daysPerWeek,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: List.generate(DateTime.daysPerWeek, (index) {
        final weekDay = simpleCalendarController.getDaysOfWeek(locale)[index];

        if (weekdayBuilder != null) {
          return weekdayBuilder!(context, weekDay);
        }

        return _beauty(context, weekDay);
      }),
    );
  }


  Widget _beauty(BuildContext context, String weekday) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            width: WidgetSize(context).sizedBox1_5,
            color: Style.greyEAEAEA
          )
        )
      ),
      child: Center(
        child: Text(
          weekday.capitalize(),
          style: TextStyle(
            fontSize: WidgetSize(context).sizedBox13,
            fontWeight: FontWeight.bold,
            color: switch(weekday){
              '일' => Style.cocacolaRed,
              '토' => Colors.blueAccent,
              _ => Colors.grey[600]
            }
          )
        ),
      ),
    );
  }
}