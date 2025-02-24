import 'package:intl/intl.dart';


extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension DateUtilsExtensions on DateTime {
  bool get isLeapYear {
    bool leapYear = false;

    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap) {
      return false;
    } else if (year % 4 == 0) {
      return true;
    }

    return leapYear;
  }

  DateTime toFirstDayOfNextMonth() => DateTime(
    year,
    month + 1,
  );

  DateTime get nextDay => DateTime(year, month, day + 1);

  bool isSameDayOrAfter(DateTime other) => isAfter(other) || isSameDay(other);

  bool isSameDayOrBefore(DateTime other) => isBefore(other) || isSameDay(other);

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  DateTime removeTime() => DateTime(year, month, day);

  /// [Date] object for given dateTime based on calendar type eg. iran has Jalali

  Future<String> getFormattedDate(String locale, DateTime month) async {
    final String formattedDate =
        '${DateFormat('yyyy년 MM월', locale).format(DateTime(month.year, month.month))}';
    return formattedDate;
  }

// 다른 부분에서 사용할 때


  // Future<Date> date(LanguageCode languageCode) async {
  //   if (languageCode == LanguageCode.ko) {
  //     return toGregorian();
  //   } else {
  //     return toGregorian();
  //   }
  // }
  //
  // /// Full descriptive title of dateTime eg. 19 January 1994 for gregorian
  // Future<String> localizedTitleMMYY(LanguageCode languageCode) async {
  //   Date date = await this.date(languageCode);
  //   final f = date.formatter;
  //   return '${f.mN}  ${f.yyyy}';
  // }
}