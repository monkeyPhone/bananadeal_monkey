import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/controller/reservation_controller.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../../../components/custom_text_form.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../package/clean_calendar/controllers/simple_calendar_controller.dart';
import '../../package/clean_calendar/widgets/calendar.dart';
import 'components/reservation_divider.dart';
import 'components/reservation_people_area.dart';


class ReservationCalenderArea extends StatelessWidget {
  const ReservationCalenderArea({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReservationController>(
        builder: (controller)
            =>
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReservationDivider(mainText: '방문 일정', otherText: '* 선택'),
                    ReservationPeopleArea(
                        text: '방문날짜',
                        widget: _CustomReservationButton(
                          hintText: controller.reservationDay.value.year == 0
                              ? '방문 날짜를 선택해주세요.'
                              : '${DateFormat("yyyy년 MM월 dd일").format(controller.reservationDay.value)}',
                          hintColor: controller.reservationDay.value.year == 0
                              ? Style.greyWrite : Style.karajeck,
                          onTap: (){
                            FocusScope.of(context).unfocus();
                            Future.delayed(Duration.zero, (){
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox18),
                                        ),
                                        child: SingleChildScrollView(
                                          child: SimpleCalendar(
                                            dayRadius: WidgetSize(context).sizedBox6,
                                            padding: EdgeInsets.all(WidgetSize(context).sizedBox12),
                                            calendarController: SimpleCalendarController(
                                              onDayTapped: (date) {
                                          
                                                debugPrint('on day tapped is: $date');
                                              },
                                              onChangeMonthTapped: (sDate, eDate) {
                                                debugPrint('Start date is: $sDate and end date is: $eDate');
                                              },
                                              weekdayStart: DateTime.sunday,
                                              initialFocusDate: controller.reservationDay.value.year == 0 ?  DateTimeConfig().now : controller.reservationDay.value,
                                            ),
                                            calendarCrossAxisSpacing: 0,
                                            locale: const Locale('ko').languageCode, // Change `en` to `fa` to test Shamsi calendar
                                            daySelectedBackgroundColor: controller.reservationDay.value.year == 0 ? Colors.blueAccent : Style.yellow,
                                          
                                          ),
                                        ),
                                      )
                              );
                            });
                          },
                        )
                    ),
                    ReservationPeopleArea(
                        isbp: WidgetSize(context).sizedBox8,
                        text: '방문시간',
                        widget: _CustomReservationButton(
                          hintText:
                              controller.reservationTime.value.hour == 0
                              ? '방문 예상 시간을 선택해주세요.'
                              : controller.reservationTime.value.hour <= 12
                                  ? '오전 ${DateFormat("h시 mm분").format(controller.reservationTime.value)}'
                                  : '오후 ${DateFormat("h시 mm분").format(controller.reservationTime.value)}',
                          hintColor: controller.reservationTime.value.hour == 0
                              ? Style.greyWrite : Style.blackWrite,
                          onTap: (){
                            FocusScope.of(context).unfocus();
                            if(controller.reservationDay.value.year == 0){
                              controller.commonWidgets.customSnackbar('예약 날짜를 먼저 설정해주세요');
                            } else {
                              showCupertinoModalPopup<void>(
                                context: context,
                                builder: (BuildContext context) => Container(
                                  width: WidgetSize(context).widthCommon,
                                  height: WidgetSize(context).width06,
                                  // The Bottom margin is provided to align the popup above the system
                                  // navigation bar.
                                  // Provide a background color for the popup.
                                  color: CupertinoColors.systemBackground.resolveFrom(context),
                                  // Use a SafeArea widget to avoid system overlaps.
                                  child: Container(
                                    padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
                                    color: Colors.transparent,
                                    child: SafeArea(
                                      top: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: WidgetSize(context).height60px,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                RippleDecorationButton(
                                                  onTap: (){
                                                    controller.updateDateTimeTime(DateTime(0));
                                                    Get.back();
                                                  },
                                                  widget: Text('취소',
                                                    style: TextStyle(
                                                        color: Style.cocacolaRed,
                                                        fontSize: WidgetSize(context).sizedBox18
                                                    ),
                                                  ),
                                                  inerMargin: EdgeInsets.all(
                                                      WidgetSize(context).sizedBox12
                                                  ),
                                                ),
                                                RippleDecorationButton(
                                                  onTap: (){
                                                    if(Get.isSnackbarOpen){
                                                      Get.back();
                                                    } else {
                                                      final DateTime now = DateTimeConfig().now;
                                                      // if(controller.setTime.value.hour > 0 && controller.setTime.value.hour < 8 )
                                                      // {
                                                      //   CommonWidgets().customSnackbar('선택할 수 없는 시간입니다.');
                                                      //   controller.updateDateTimeTime(DateTime(0));
                                                      // }
                                                      if(
                                                      controller.reservationDay.value.day ==  controller.setTime.value.day &&
                                                          controller.setTime.value.hour < now.hour)
                                                      {
                                                        controller.commonWidgets.customSnackbar('선택할 수 없는 시간입니다.');
                                                      }

                                                     else if(controller.setTime.value.hour == 0){
                                                        controller.updateDateTimeTime(DateTimeConfig().now);
                                                        controller.setDateTimeTime(DateTime(0));
                                                        Get.back();
                                                      }
                                                      else{
                                                        controller.updateDateTimeTime(controller.setTime.value);
                                                        controller.setDateTimeTime(DateTime(0));
                                                        Get.back();
                                                      }
                                                    }
                                                  },
                                                  widget: Text('확인',
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: WidgetSize(context).sizedBox18
                                                    ),
                                                  ),
                                                  inerMargin: EdgeInsets.all(WidgetSize(context).sizedBox12),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child:  CupertinoDatePicker(
                                              initialDateTime: DateTimeConfig().now,
                                              mode: CupertinoDatePickerMode.time,
                                              use24hFormat: true,
                                              // This is called when the user changes the time.
                                              onDateTimeChanged: (DateTime newTime) {
                                                // setState(() => time = newTime);
                                                controller.setDateTimeTime(newTime);
                                              },
                                            ),
                                          ),
                                          SizedBox(height: controller.deviceHeight.value-WidgetSize(context).height60px,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        )
                    ),
                    SizedBox(
                      width: WidgetSize(context).widthCommon,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: WidgetSize(context).sizedBox16,
                          bottom: WidgetSize(context).sizedBox16,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('* 방문 매장의 영업시간을 사전에 꼭! 확인하세요.',
                              style: TextStyle(
                                color: Colors.lightGreen,
                                fontSize: WidgetSize(context).sizedBox15,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              height: WidgetSize(context).sizedBox3,
                            ),
                            Text(
                              controller.storeStartTime.value == '' && controller.storeEndTime.value == ''
                                  ? '운영시간 없음'
                                  : '운영시간 ${controller.dayPas.value} ${ controller.storeStartTime.value} : ${controller.storeEndTime.value}',
                              style: TextStyle(
                                color: Colors.lightGreen,
                                fontSize: WidgetSize(context).sizedBox14,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
    );
  }
}


class _CustomReservationButton extends StatelessWidget {
  final String hintText;
  final Color hintColor;
  final GestureTapCallback onTap;
  const _CustomReservationButton({
    super.key,
    required this.hintText,
    required this.hintColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomTextFormField3(
            hintText: hintText,
            hintColor: hintColor,
            enabled: false,
            fillColor: Style.white,
            contentPadding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox10),
            onChanged: (val){},
            textController: TextEditingController()
        ),
        Positioned.fill(
            child: SizedBox(
              child: RippleDecorationButton(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox10)),
                onTap: onTap, widget: SizedBox(),
              ),
            )
        )
      ],
    );
  }
}

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}