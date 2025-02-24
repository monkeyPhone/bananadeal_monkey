import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/neumorphic/src/widget/button.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppOutsFunction {
  const AppOutsFunction();

  Timer cancelTimer(void Function() callback) =>
      Timer(const Duration(seconds: 2), callback );

  Future<void> futureDelay(int milliseconds) async{
    await Future.delayed(Duration(milliseconds: milliseconds));
  }


  // GestureDragEndCallback? onHorizontalDragEnd(GestureDragEndCallback? onHorizontalDragEnd){
  //   return MainSingleton.device.isIos
  //       ? onHorizontalDragEnd : null;
  // }

  NeumorphicButtonClickListener? debounce2({required VoidCallback callback, int? milliseconds}) {
    Timer? timer;
    return () {
      if (timer != null) {
        timer!.cancel();
      }
      timer = Timer(Duration(milliseconds: milliseconds ?? 300), (){
        callback();
        if (timer != null) {
          timer!.cancel();
        }
      });
    };
  }


  VoidCallback debounce({required VoidCallback callback, int? milliseconds}) {
    Timer? timer;
    return () {
      if (timer != null) {
        timer!.cancel();
      }
      timer = Timer(Duration(milliseconds: milliseconds ?? 300), (){
        callback();
        if (timer != null) {
          timer!.cancel();
        }
      });
    };
  }

  ValueChanged<String> debounceText(ValueChanged<String> onChanged, [int milliseconds = 600]) {
    Timer? timer;
    return (val) {
      if (timer != null) {
        timer!.cancel();
      }
      timer = Timer(Duration(milliseconds: milliseconds), (){
        onChanged(val);
        if (timer != null) {
          timer!.cancel();
        }
      });
    };
  }

  VoidCallback throttle(VoidCallback callback, [int milliseconds = 500]) {
    bool isThrottled = false;
    return () {
      if (!isThrottled) {
        isThrottled = true;
        // callback();
        Timer(const Duration(milliseconds: 300), callback);
        Timer(Duration(milliseconds: milliseconds), () {
          isThrottled = false;
        });
      }
    };
  }

  (bool ,bool, String) calculateTime({
    required String smTimeStart,
    required String smTimeEnd,
    required String smConsultationTime,
  }) {
    final bool isReg = smTimeStart == '' || smTimeEnd == '' ? false : true;
    if(isReg){
      List<String> dayList = smConsultationTime.split(',');

      int startHour = int.parse(smTimeStart.split(':')[0]);
      int startmin = int.parse(smTimeStart.split(':')[1]);
      int endHour = int.parse(smTimeEnd.split(':')[0]);
      int endmin = int.parse(smTimeEnd.split(':')[1]);
      DateTime now = DateTimeConfig().now;
      DateTime time = DateTime(now.year, now.month, now.day, now.hour, now.minute);
      DateTime startTime  = DateTime(now.year, now.month, now.day, startHour, startmin);
      DateTime endTime  = DateTime(now.year, now.month, now.day, endHour, endmin);
      bool isOpen = time.isAfter(startTime) && time.isBefore(endTime) && dayList[now.weekday-1] == 'Y';

      String dayPas;

      if(dayList.where((element) => element == 'Y').length == 7){
        dayPas = '매일';
      }
      else if(dayList.where((element) => element == 'Y').length == 6 && dayList.last == 'N'){
        dayPas = '월~토';
      }
      else if(dayList.where((element) => element == 'Y').length == 5 && dayList[5] == 'N' && dayList[6] == 'N'){
        dayPas = '평일';
      }
      else if(dayList.where((element) => element == 'N').length == 5 && dayList[5] == 'Y' && dayList[6] == 'Y'){
        dayPas = '주말';
      }
      else{
        List<String> daylll = [];
        for(int i = 0; i < dayList.length; i++){
          if(dayList[i] == 'Y'){
            daylll.add(switch(i){
              0 => '월,',
              1 => '화,',
              2 => '수,',
              3 => '목,',
              4 => '금,',
              5 => '토,',
              6 => '일,',
              _ => ''
            });
          }
        }
        String joinString = daylll.join('');
        String newString = joinString.substring(0, joinString.length - 1);
        dayPas = newString;
      }

      return (isReg, isOpen, dayPas);
    }
    else{
      return (isReg, false, '');
    }
  }

  String chatTimeLine(String time){
    String result;
    if(time == ''){
      result = '';
    } else{
      DateTime form  = DateTime.parse(time).toLocal();
      String past = DateFormat("yyyy-MM-dd").format(form);
      String today = DateFormat("HH:mm").format(form);
      result =  form.day == DateTimeConfig().now.day
          ? today
          : past;
    }
    return result;
  }

  bool pwRegExp(String val) => RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*(),.\-_+=]{5,}$').hasMatch(val);

  String chatConvertType({
    required String chat,
    required String time
  }){
    String result = chat.contains('UPLOAD/IMAGES') || chat.contains('{"imageUrl":"UPLOAD')
        ?  '사진을 보냈습니다.'
        :  chat.contains('SEND/DEAL/ACCEPT')
        ?  '딜을 수락했어요 (알림창)'
        :  chat.contains('SEND/DEAL/INVITATION/')
        ?  '초대장을 보냈습니다.'
        :  chat == '' && time == ''
        ?  '아직 대화가 없어요 채팅을 시작해보세요 '
        :  chat;

    return result;
  }


  String convertTelecom({
    required String currentAgency, required String requestAgency
  }){
    String agency = currentAgency == '0'
        ? '신규'
        :
    '${switch(currentAgency){
      '1' => 'SK',
      '2' => 'KT',
      '3' => 'LG',
      '4' => '7모바일',
      '5' => 'M모바일',
      '6' => 'U모바일',
      '8' => 'Hello모바일 (KT망)',
      '12' => 'Hello모바일 (LG망)',
      '14' => '기타',
      _ => ''
    }
    } -> ${switch(requestAgency){
      '1' => 'SK',
      '2' => 'KT',
      '3' => 'LG',
      '4' => '7모바일',
      '5' => 'M모바일',
      '6' => 'U모바일',
      '8' => 'Hello모바일 (KT망)',
      '12' => 'Hello모바일 (LG망)',
      '14' => '기타',
      _ => '상관없어요'
    }} ';
    return agency;
  }

  String convertInstallment(int installmentMonth) => switch(installmentMonth){
    48 => '48개월',
    36 => '36개월',
    24 => '24개월',
    12 => '12개월',
    0 => '현금구매',
    -1 => '상관없음',
    _ => ''
  };

  String convertTelecomSupport(String diSupportType) => switch(diSupportType){
    'GONGSI' => '공시지원',
    'CHOICE' => '선택약정',
    _ => '상관없음'
  };

  String convertHtml(String spec) {
    List<String> designDetail = spec.split('\n');
    String designDetailFinal = '';
    for (int i = 0; i < designDetail.length; i++){
      designDetail[i] = designDetail[i].replaceAll('<u>', '');
      designDetail[i] = designDetail[i].replaceAll('</u>', '');
      designDetailFinal += designDetail[i];
    }

    return designDetailFinal;
  }

}