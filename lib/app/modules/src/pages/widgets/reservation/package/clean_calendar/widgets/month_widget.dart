import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/package/clean_calendar/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../controllers/simple_calendar_controller.dart';
import '../utils/enums.dart';

class MonthWidget extends StatelessWidget {
  final DateTime month;
  final DateTime kMonth;
  final String locale;
  final Layout? layout;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final SimpleCalendarController simpleCalendarController;
  final Widget Function(BuildContext context, String month)? monthBuilder;

  const MonthWidget({
    Key? key,
    required this.month,
    required this.kMonth,
    required this.simpleCalendarController,
    required this.locale,
    required this.layout,
    required this.monthBuilder,
    required this.textStyle,
    required this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String text =
        '${DateFormat('yyyy년 MM월', locale).format(DateTime(kMonth.year, kMonth.month))}';
    final Future<String> monthTitle;
    if (locale.contains(RegExp(r'^(ko|KO)$'))) {
      monthTitle =
          DateTime(kMonth.year, kMonth.month).getFormattedDate(locale, kMonth);
    } else {
      monthTitle =
          DateTime(kMonth.year, kMonth.month).getFormattedDate(locale, kMonth);
    }

    // if (monthBuilder != null) {
    //   return monthBuilder!(context, text);
    // }

    return _beauty(context, monthTitle);
  }


  Widget _beauty(BuildContext context, Future<String> monthTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RippleIconButton(
            onTap: simpleCalendarController.onPreviousMonthClick,
            icon: Icons.arrow_back_ios,
            margin: EdgeInsets.all(WidgetSize(context).sizedBox15),
            padding: 0,
            iconSize: WidgetSize(context).sizedBox25,
            iconColor: Colors.black54
        ),
        Expanded(
          child: FutureBuilder(
              future: monthTitle,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox.shrink();
                }
                return FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    snapshot.requireData,
                    textAlign: textAlign ?? TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Style.blackWrite,
                        fontSize: WidgetSize(context).sizedBox20
                    ),
                  ),
                );
              }),
        ),
        RippleIconButton(
            onTap: simpleCalendarController.onNextMonthClick,
            icon: Icons.arrow_forward_ios,
            margin: EdgeInsets.all(WidgetSize(context).sizedBox15),
            padding: 0,
            iconSize: WidgetSize(context).sizedBox25,
            iconColor: Colors.black54
        ),

      ],
    );
  }
}