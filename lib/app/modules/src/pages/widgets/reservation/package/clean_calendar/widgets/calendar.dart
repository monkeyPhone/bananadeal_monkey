import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/package/clean_calendar/components/calendar_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../controller/reservation_controller.dart';
import '../controllers/simple_calendar_controller.dart';
import '../models/day_values_model.dart';
import '../utils/enums.dart';
import '../utils/value_listenable_builder.dart';
import 'days_widget.dart';
import 'month_widget.dart';
import 'weekdays_widget.dart';

class SimpleCalendar extends StatefulWidget {
  /// The language locale
  final String locale;

  /// Scroll controller
  final ScrollController? scrollController;

  /// If is to show or not the weekdays in calendar
  final bool showWeekdays;

  /// `layout` has not been completed yet (we have two layouts with one style!).
  /// What layout (design) is going to be used
  // TODO: Handle layouts
  final Layout? layout;

  /// The space between month and calendar
  final double spaceBetweenMonthAndCalendar;

  /// The space between calendars
  final double spaceBetweenCalendars;

  /// The horizontal space in the calendar dates
  final double calendarCrossAxisSpacing;

  /// The vertical space in the calendar dates
  final double calendarMainAxisSpacing;

  /// The parent padding
  final EdgeInsets? padding;

  /// The label text style of month
  final TextStyle? monthTextStyle;

  /// The label text align of month
  final TextAlign? monthTextAlign;

  /// The label text align of month
  final TextStyle? weekdayTextStyle;

  /// The label text style of day
  final TextStyle? dayTextStyle;

  /// The day selected background color
  final Color? daySelectedBackgroundColor;

  /// The day background color
  final Color? dayBackgroundColor;

  /// The day selected background color that is between day selected edges
  final Color? daySelectedBackgroundColorBetween;

  /// The day disable background color
  final Color? dayDisableBackgroundColor;

  /// The day disable color
  final Color? dayDisableColor;

  /// The radius of day items
  final double dayRadius;

  /// A builder to make a customized month
  final Widget Function(BuildContext context, String month)? monthBuilder;

  /// A builder to make a customized weekday
  final Widget Function(BuildContext context, String weekday)? weekdayBuilder;

  /// A builder to make a customized day of calendar
  final Widget Function(BuildContext context, DayValues values)? dayBuilder;

  /// The controller of MonthCalendar
  final SimpleCalendarController calendarController;

  const SimpleCalendar({
    super.key,
    this.locale = 'ko',
    this.scrollController,
    this.showWeekdays = true,
    this.layout = Layout.beauty,
    this.calendarCrossAxisSpacing = 4,
    this.calendarMainAxisSpacing = 4,
    this.spaceBetweenCalendars = 24,
    this.spaceBetweenMonthAndCalendar = 24,
    this.padding,
    this.monthBuilder,
    this.weekdayBuilder,
    this.dayBuilder,
    this.monthTextAlign,
    this.monthTextStyle,
    this.weekdayTextStyle,
    this.daySelectedBackgroundColor,
    this.dayBackgroundColor,
    this.daySelectedBackgroundColorBetween,
    this.dayDisableBackgroundColor,
    this.dayDisableColor,
    this.dayTextStyle,
    this.dayRadius = 6,
    required this.calendarController,
  }) : assert(layout != null ||
      (monthBuilder != null &&
          weekdayBuilder != null &&
          dayBuilder != null));

  @override
  State<SimpleCalendar> createState() => _SimpleCalendarState();
}

class _SimpleCalendarState extends State<SimpleCalendar> {
  @override
  void initState() {
    initializeDateFormatting();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: childColumn(),
    );
  }

  Widget childColumn() {
    return ValueListenableBuilder2(
      first: widget.calendarController.startGDateMonth,
      second: widget.calendarController.startKDateMonth,
      builder: (context, gDate, kDate, child) {

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: WidgetSize(context).sizedBox45,
              width: double.maxFinite,
              child: Padding(
                padding: EdgeInsets.only(
                  left: WidgetSize(context).sizedBox8
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '방문날짜 선택',
                      style: TextStyle(
                        color: Style.blackWrite,
                        fontSize: WidgetSize(context).sizedBox21,
                        fontWeight: FontWeight.w600
                      ),
                    ),

                    Row(
                      children: [
                        RippleIconButton(
                            borderRadius: 0,
                            iconSize: WidgetSize(context).sizedBox30,
                            padding: 0,
                            onTap: (){
                              widget.calendarController.clearSelectedDate();
                              widget.calendarController.clearSelectedMonth();
                              // ReservationController.to.setDateTime(DateTime(0));
                            }, icon: Icons.refresh,
                            iconColor: Style.greyWrite
                        ),
                        SizedBox(
                          width: WidgetSize(context).sizedBox20,
                        ),
                        RippleIconButton(
                          borderRadius: 0,
                          iconSize: WidgetSize(context).sizedBox35,
                          padding: 0,
                            onTap: (){
                              Get.back();
                            }, icon: Icons.close,
                            iconColor: Style.greyWrite
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: WidgetSize(context).sizedBox10),
            SizedBox(
              width: double.maxFinite,
              child: MonthWidget(
                month: gDate,
                kMonth: kDate,
                simpleCalendarController: widget.calendarController,
                locale: widget.locale,
                layout: widget.layout,
                monthBuilder: widget.monthBuilder,
                textAlign: widget.monthTextAlign,
                textStyle: widget.monthTextStyle,
              ),
            ),
            SizedBox(height: WidgetSize(context).sizedBox20),
            Column(
              children: [
                WeekdaysWidget(
                  showWeekdays: widget.showWeekdays,
                  simpleCalendarController: widget.calendarController,
                  locale: widget.locale,
                  layout: widget.layout,
                  weekdayBuilder: widget.weekdayBuilder,
                  textStyle: widget.weekdayTextStyle,
                ),
                AnimatedBuilder(
                  animation: widget.calendarController,
                  builder: (_, __) {
                    return DaysWidget(
                      month: gDate,
                      kMonth: kDate,
                      simpleCalendarController: widget.calendarController,
                      calendarCrossAxisSpacing: widget.calendarCrossAxisSpacing,
                      calendarMainAxisSpacing: widget.calendarMainAxisSpacing,
                      layout: widget.layout,
                      dayBuilder: widget.dayBuilder,
                      backgroundColor: widget.dayBackgroundColor,
                      selectedBackgroundColor:
                      widget.daySelectedBackgroundColor,
                      selectedBackgroundColorBetween:
                      widget.daySelectedBackgroundColorBetween,
                      disableBackgroundColor: widget.dayDisableBackgroundColor,
                      dayDisableColor: widget.dayDisableColor,
                      radius: widget.dayRadius,
                      textStyle: widget.dayTextStyle,
                      locale: widget.locale,
                    );
                  },
                )
              ],
            ),
            SizedBox(height: WidgetSize(context).sizedBox40),
            SizedBox(
              height: WidgetSize(context).sizedBox45,
              width: double.maxFinite,
              child: Row(
                children: [
                  SizedBox(
                    width: WidgetSize(context).sizedBox10,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                      flex: 4,
                      child: CalendarButton(
                          onTap: (){
                            ReservationController.to.setDateTime(DateTime(0));
                            ReservationController.to.updateDateTimeTime(DateTime(0));
                            Get.back();
                          },
                          buttonText: '초기화',
                          backGroundColor: Style.white,
                          borderColor: Style.greyWrite
                      )
                  ),
                  SizedBox(
                    width: WidgetSize(context).sizedBox20,
                  ),
                  Flexible(
                      fit: FlexFit.tight,
                      flex: 7,
                      child: CalendarButton(
                          onTap: (){
                            widget.calendarController.selectDay();
                          },
                          buttonText: '날짜 설정',
                          backGroundColor: Style.yellow,
                          borderColor: Style.yellow
                      )
                  ),
                  SizedBox(
                    width: WidgetSize(context).sizedBox10,
                  ),
                ],
              ),
            ),
            SizedBox(height: WidgetSize(context).sizedBox10),
          ],
        );
      },
    );
  }
}