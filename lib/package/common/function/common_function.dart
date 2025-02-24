import 'dart:async';
import 'package:flutter/material.dart';

abstract class CommonFunction {
  const CommonFunction();

  Future<void> futureDelay(int milliseconds);

  VoidCallback debounce({required VoidCallback callback, int? milliseconds});

  ValueChanged<String> debounceText(ValueChanged<String> onChanged, [int milliseconds = 600]);

  VoidCallback throttle(VoidCallback callback, [int milliseconds = 500]);

  (bool ,bool, String) calculateTime({
    required String smTimeStart,
    required String smTimeEnd,
    required String smConsultationTime,
  });

  String chatTimeLine(String time);

  String convertTime(String date);

  String chatConvertType({
    required String chat,
    required String time
  });

  String chatConvertTypeString({
    required String chat,
  });


  String formatDateKO(DateTime date);


  String formatMoneyString(String? value);

  String formatMoneyInt(int value);

  String sortName(int index);

  String convertHopePhone(String diHopePhone);

  String convertTelecom({
    required String currentAgency, required String requestAgency
  });

  String formatOtpTime(int seconds);


  String convertInstallment(int installmentMonth);

  String convertTelecomSupport(String diSupportType);

  bool nickNext(String text);


  String validateNick(String nick);

  String validationEmail(String val);

  String validatePw(String pw1, String pw2);

}