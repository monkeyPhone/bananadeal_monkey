import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/package/clean_calendar/utils/extensions.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../controllers/simple_calendar_controller.dart';
import '../models/day_values_model.dart';
import '../utils/date_time.dart';
import '../utils/enums.dart';

class DaysWidget extends StatelessWidget {
  final SimpleCalendarController simpleCalendarController;
  final DateTime month;
  final DateTime kMonth;
  final double calendarCrossAxisSpacing;
  final double calendarMainAxisSpacing;
  final Layout? layout;
  final Widget Function(
      BuildContext context,
      DayValues values,
      )? dayBuilder;
  final Color? selectedBackgroundColor;
  final Color? backgroundColor;
  final Color? selectedBackgroundColorBetween;
  final Color? disableBackgroundColor;
  final Color? dayDisableColor;
  final double radius;
  final TextStyle? textStyle;
  final String locale;

  const DaysWidget(
      {Key? key,
        required this.month,
        required this.kMonth,
        required this.simpleCalendarController,
        required this.calendarCrossAxisSpacing,
        required this.calendarMainAxisSpacing,
        required this.layout,
        required this.dayBuilder,
        required this.selectedBackgroundColor,
        required this.backgroundColor,
        required this.selectedBackgroundColorBetween,
        required this.disableBackgroundColor,
        required this.dayDisableColor,
        required this.radius,
        required this.textStyle,
        required this.locale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Start weekday - Days per week - The first weekday of this month
    // 7 - 7 - 1 = -1 = 1
    // 6 - 7 - 1 = -2 = 2

    // What it means? The first weekday does not change, but the start weekday have changed,
    // so in the layout we need to change where the calendar first day is going to start.
    final List<DateTime> holyDay =[
      DateTime(2024, 12,25),
      DateTime(2025, 1,1), DateTime(2025, 1,28), DateTime(2025, 1,29), DateTime(2025, 1,30),
      DateTime(2025, 3,1), DateTime(2025, 3,3), DateTime(2025, 5,5), DateTime(2025, 5,6),
      DateTime(2025, 6,6), DateTime(2025, 8,15), DateTime(2025, 10,3),DateTime(2025, 10,5),
      DateTime(2025, 10,6),DateTime(2025, 10,7),DateTime(2025, 10,8),DateTime(2025, 10,9),DateTime(2025, 12,25),
      DateTime(2026, 1,1), DateTime(2026, 2,16), DateTime(2026, 2,17), DateTime(2026, 2,18),
      DateTime(2026, 3,1), DateTime(2026, 3,2), DateTime(2026, 5,5), DateTime(2026, 5,24),
      DateTime(2026, 5,25), DateTime(2026, 6,6), DateTime(2026, 8,15), DateTime(2026, 8,17),
      DateTime(2026, 9,24), DateTime(2026, 9,25), DateTime(2026, 9,26), DateTime(2026, 10,3),
      DateTime(2026, 10,5),DateTime(2026, 10,9), DateTime(2026, 12,25),
    ];


    final int moonStartWeekday;
    final int lengthOfMoon;
    final int controllerWeekDayStart;
    if (locale.contains(RegExp(r'^(ko|KO)$'))) {
      moonStartWeekday = DateTime(month.year, month.month).weekday;
      lengthOfMoon = DateTime(month.year, month.month + 1, 0).day;
      controllerWeekDayStart = simpleCalendarController.weekdayStart;
    } else {
      moonStartWeekday = DateTime(month.year, month.month).weekday;
      lengthOfMoon = DateTime(month.year, month.month + 1, 0).day;
      controllerWeekDayStart = simpleCalendarController.weekdayStart;
    }

    int monthPositionStartDay =
    (controllerWeekDayStart - DateTime.daysPerWeek - moonStartWeekday)
        .abs();

    monthPositionStartDay = monthPositionStartDay > DateTime.daysPerWeek
        ? monthPositionStartDay - DateTime.daysPerWeek
        : monthPositionStartDay;

    final start = monthPositionStartDay == 7 ? 0 : monthPositionStartDay;

    // If the monthPositionStartDay is equal to 7, then in this layout logic will cause a trouble, because it will
    // have a line in blank and in this case 7 is the same as 0.

    return GridView.count(
      crossAxisCount: DateTime.daysPerWeek,
      physics: const NeverScrollableScrollPhysics(),
      addRepaintBoundaries: false,
      padding: EdgeInsets.zero,
      crossAxisSpacing: calendarCrossAxisSpacing,
      mainAxisSpacing: calendarMainAxisSpacing,
      shrinkWrap: true,
      children: List.generate(lengthOfMoon + start, (index) {
        if (index < start) return const SizedBox.shrink();
        var gDay = month;
        var kDay = kMonth;
        final text = (index + 1 - start).toString();

        DateTime daySelected = month;

        bool isSelected = false;

        if (locale.contains(RegExp(r'^(ko|KO)$'))) {
          kDay =  DateTime(month.year, month.month, (index + 1 - start));
          isSelected =  kDay.isSameDay(simpleCalendarController.initialFocusDate) ? true : false;
          daySelected = kDay;
        } else {
          gDay = DateTime(month.year, month.month, (index + 1 - start));
          isSelected =
          gDay.isSameDay(DateTimeUtils.todayZeroHour) ? true : false;
          daySelected = gDay;
        }

        if (simpleCalendarController.selectedDay != null) {
          isSelected = daySelected
              .isAtSameMomentAs(simpleCalendarController.selectedDay!);
        }

        Widget widget;

        final DateTime now = DateTimeConfig().now;

        final dayValues = DayValues(
          day: daySelected,
          kDay: kDay,
          isFirstDayOfWeek:
          gDay.weekday == simpleCalendarController.weekdayStart,
          isLastDayOfWeek: gDay.weekday == simpleCalendarController.weekdayEnd,
          isSelected: isSelected,
          text: text,
          selectedMaxDate: daySelected,
          selectedMinDate:
          daySelected, //TODO: simpleCalendarController.rangeMinDate - handle range selected date
        );

        if (dayBuilder != null) {
          widget = dayBuilder!(context, dayValues);
        } else {
          widget = _beauty(context, dayValues, now, holyDay);
        }

        return InkWell(
          onTap: () {
            if (!simpleCalendarController.readOnly) {
              simpleCalendarController.onDayClick(daySelected);
            }
          },
          child: widget,
        );
      }),
    );
  }


  Widget _beauty(BuildContext context, DayValues values, DateTime now, List<DateTime> holiday) {
    BorderRadiusGeometry? borderRadius;
    Color bgColor = Colors.transparent;
    FontWeight? fontWeight;
    if (locale.contains(RegExp(r'^(ko|KO)$'))) {
      fontWeight = values.isFirstDayOfWeek || values.isLastDayOfWeek
          ? FontWeight.bold
          : null;
    } else {
      fontWeight = values.isFirstDayOfWeek || values.isLastDayOfWeek
          ? FontWeight.bold
          : null;
    }
    TextStyle txtStyle =
    (textStyle ?? Theme.of(context).textTheme.bodyLarge)!.copyWith(
      fontSize: WidgetSize(context).sizedBox13,
        color: backgroundColor != null
            ? backgroundColor!.computeLuminance() > .5
            ? Colors.black
            : Colors.white
            : (now.year == values.kDay.year && now.month == values.kDay.month && now.day > values.kDay.day)
              ? Style.greyWrite
              :
              values.kDay.weekday == 7 || holiday.contains(DateTime(values.kDay.year, values.kDay.month, values.kDay.day))
                ? Style.cocacolaRed
                :   values.kDay.weekday == 6
                      ? Colors.blueAccent
                      : Style.karajeck,
        fontWeight: fontWeight);

    if (values.isSelected) {
      if (values.isFirstDayOfWeek) {
        borderRadius = BorderRadius.only(
          topLeft: Radius.circular(radius),
          bottomLeft: Radius.circular(radius),
        );
      } else if (values.isLastDayOfWeek) {
        borderRadius = BorderRadius.only(
          topRight: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        );
      }

      if ((values.selectedMinDate != null &&
          values.day.isSameDay(values.selectedMinDate!)) ||
          (values.selectedMaxDate != null &&
              values.day.isSameDay(values.selectedMaxDate!))) {
        bgColor =
            selectedBackgroundColor ?? Theme.of(context).colorScheme.primary;
        txtStyle =
            (textStyle ?? Theme.of(context).textTheme.bodyLarge)!.copyWith(
              fontSize: WidgetSize(context).sizedBox13,
              color: selectedBackgroundColor != null
                  ? selectedBackgroundColor!.computeLuminance() > .5
                  ? Colors.black
                  : Colors.white
                  : Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            );

        if (values.selectedMinDate == values.selectedMaxDate) {
          borderRadius = BorderRadius.circular(radius);
        } else if (values.selectedMinDate != null &&
            values.day.isSameDay(values.selectedMinDate!)) {
          borderRadius = BorderRadius.only(
            topLeft: Radius.circular(radius),
            bottomLeft: Radius.circular(radius),
          );
        } else if (values.selectedMaxDate != null &&
            values.day.isSameDay(values.selectedMaxDate!)) {
          borderRadius = BorderRadius.only(
            topRight: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          );
        }
      } else {
        bgColor = selectedBackgroundColorBetween ??
            Theme.of(context).colorScheme.primary.withOpacity(.3);
        txtStyle =
            (textStyle ?? Theme.of(context).textTheme.bodyLarge)!.copyWith(
              color:
              selectedBackgroundColor ?? Theme.of(context).colorScheme.primary,
              fontWeight: values.isFirstDayOfWeek || values.isLastDayOfWeek
                  ? FontWeight.bold
                  : null,
            );
      }
    }

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: borderRadius,
      ),
      child: Text(
        values.text,
        textAlign: TextAlign.center,
        style: txtStyle,
      ),
    );
  }
}