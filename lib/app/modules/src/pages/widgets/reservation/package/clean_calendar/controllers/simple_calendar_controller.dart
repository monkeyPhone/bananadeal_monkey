import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../components/common_widgets.dart';
import '../../../../../../../../routes/const/const_info.dart';
import '../../../controller/reservation_controller.dart';
import '../utils/date_time.dart';

class SimpleCalendarController extends ChangeNotifier {
  /// Not has been completed
  /// If the range is enabled
  // TODO: Handle rangeMode
  final bool rangeMode;

  /// If the calendar is readOnly
  final bool readOnly;

  /// In what weekday position the calendar is going to start
  final int weekdayStart;

  /// In what jalali weekday position the calendar is going to start
  final int jWeekdayStart;

  /// Function when a day is tapped
  final Function(DateTime date)? onDayTapped;

  /// Function when on change month tapped
  final Function(DateTime startDay, DateTime endDay)? onChangeMonthTapped;

  /// Function when a range is selected
  final Function(DateTime minDate, DateTime? maxDate)? onRangeSelected;

  /// An initial selected date
  final DateTime? initialDateSelected;

  /// The end of selected range
  final DateTime? endDateSelected;

  /// An initial focus date
  final DateTime initialFocusDate;

  late ValueNotifier<DateTime> startGDateMonth;
  late ValueNotifier<DateTime> startKDateMonth;

  late int weekdayEnd;
  late DateTime kDate;
  late DateTime gDate;

  SimpleCalendarController({
    this.rangeMode = false,
    this.readOnly = false,
    this.endDateSelected,
    this.initialDateSelected,
    this.onDayTapped,
    this.onChangeMonthTapped,
    this.onRangeSelected,
    this.weekdayStart = DateTime.monday,
    this.jWeekdayStart = 1,
    required this.initialFocusDate,
  })  : assert(weekdayStart <= DateTime.sunday),
        assert(weekdayStart >= DateTime.monday) {
    final x = weekdayStart - 1;
    weekdayEnd = x == 0 ? 7 : x;
    gDate = initialFocusDate;
    kDate = initialFocusDate;
    startGDateMonth = ValueNotifier(gDate);
    startKDateMonth = ValueNotifier(kDate);
  }

  DateTime? rangeMinDate;
  DateTime? rangeMaxDate;
  DateTime? selectedDay;

  List<String> getDaysOfWeek([String locale = 'ko']) {
    var today = DateTimeUtils.todayZeroHour;
    final String weekDayFormat;

    while (today.weekday != weekdayStart) {
      today = today.subtract(const Duration(days: 1));
    }
    weekDayFormat = DateFormat.ABBR_WEEKDAY;
    final dateFormat = DateFormat(weekDayFormat, locale);
    final daysOfWeek = [
      dateFormat.format(today),
      dateFormat.format(today.add(const Duration(days: 1))),
      dateFormat.format(today.add(const Duration(days: 2))),
      dateFormat.format(today.add(const Duration(days: 3))),
      dateFormat.format(today.add(const Duration(days: 4))),
      dateFormat.format(today.add(const Duration(days: 5))),
      dateFormat.format(today.add(const Duration(days: 6)))
    ];

    return daysOfWeek;
  }

  void onDayClick(DateTime date, {bool update = true}) {
    final DateTime now = DateTimeConfig().now;
    if(date.year == now.year && date.month == now.month && date.day < now.day){

    }
    else{
      selectedDay = date;
    }
    if (update) {
      if (onDayTapped != null) {
        onDayTapped!(DateTimeUtils.dateZeroHour(date));
      }

      if (onRangeSelected != null) {
        onRangeSelected!(rangeMinDate!, rangeMaxDate);
      }
    }
    notifyListeners();
  }

  void clearSelectedDate() {
    selectedDay = null;
    notifyListeners();
  }

  void selectDay(){
    if(selectedDay == null){
      ReservationController.to.setDateTime(initialFocusDate);
      Get.back();
    }
    else {
      ReservationController.to.setDateTime(selectedDay!);
      Get.back();
    }

  }

  void clearSelectedMonth() {
    startKDateMonth.value = DateTime(initialFocusDate.year, initialFocusDate.month);
    startGDateMonth.value = DateTime(initialFocusDate.year, initialFocusDate.month);
    kDate = startKDateMonth.value;
    gDate = startGDateMonth.value;
    if (onChangeMonthTapped != null) {

    }
    notifyListeners();
  }

  void onNextMonthClick() {

    startKDateMonth.value =  DateTime(gDate.year, gDate.month + 1);
    startGDateMonth.value = DateTime(gDate.year, gDate.month + 1);
    kDate = startKDateMonth.value;
    gDate = startGDateMonth.value;
    if (onChangeMonthTapped != null) {

    }
    notifyListeners();
  }

  void onPreviousMonthClick() {
    final DateTime now = DateTimeConfig().now;
    if((gDate.year < now.year || (gDate.year == now.year && gDate.month < now.month)) ||
        (kDate.year < now.year || (kDate.year == now.year && kDate.month <= now.month))
    ){

    }
    else{
      startKDateMonth.value = DateTime(gDate.year, gDate.month - 1);
      startGDateMonth.value = DateTime(gDate.year, gDate.month - 1);
      kDate = startKDateMonth.value;
      gDate = startGDateMonth.value;
    }
    if (onChangeMonthTapped != null) {

    }
    notifyListeners();
  }
}