import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class CommonFunction {
  const CommonFunction();

  Timer cancelTimer(void Function() callback) =>
      Timer(const Duration(seconds: 2), callback );

  Future<void> futureDelay(int milliseconds) async{
    await Future.delayed(Duration(milliseconds: milliseconds));
  }


  // GestureDragEndCallback? onHorizontalDragEnd(GestureDragEndCallback? onHorizontalDragEnd){
  //   return isIos
  //       ? onHorizontalDragEnd : null;
  // }

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

  String convertTime(String date) => DateFormat("yyyy.MM.dd").format(DateTime.parse(date).toLocal());

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

  String chatConvertTypeString({
    required String chat,
  }){
    String result = chat.contains('UPLOAD/IMAGES') || chat.contains('{"imageUrl":"UPLOAD')
        ?  '사진을 보냈습니다.'
        :  chat.contains('SEND/DEAL/ACCEPT')
        ?  '딜을 수락했어요 (알림창)'
        :  chat.contains('SEND/DEAL/INVITATION/')
        ?  '초대장을 보냈습니다.'
        :  chat;

    return result;
  }


  String formatDateKO(DateTime date) {
    try{
      return DateFormat('yyyy년 MM월 dd일').format(date);
    } catch(_){
      return '0000년 00월 00일';
    }
  }


  String formatMoneyString(String? value) {
    final String result =
    value == null || value == '0'
        ?  '0원'
        :  '${NumberFormat('###,###').format(int.parse(value))}원';

    return result;
  }

  String formatMoneyInt(int value) => NumberFormat('###,###').format(value);

  String sortName(int index) => switch(index){
    0 => '가까운 순',
    1 => '평점 순',
    2 => '참여 순',
    3 => '단골매장 순',
    _ => ''
  };

  String convertHopePhone(String diHopePhone) => diHopePhone == '프리미엄폰' || diHopePhone == '보급폰' ||
      diHopePhone == '효도폰' || diHopePhone == '공부폰' || diHopePhone == '어린이폰'
      ?  '추천 단말기'
      :  diHopePhone;

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

  String formatOtpTime(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    final formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return '$minutes:$formattedSeconds ';
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

  bool nickNext(String text) => (text.length  >= 2 && text.length  <= 10) && RegExp(r"^[a-zA-Z가-힣0-9 ]*$")
      .hasMatch(text);


  String validateNick(String nick){
    if(nickNext(nick) || nick.isEmpty){
      return '';
    }
    else if (!RegExp(r"^[a-zA-Z가-힣0-9 ]*$").hasMatch(nick)){
      return '사용할 수 없는 닉네임입니다.';
    }
    else if(nick.length  < 2){
      return '닉네임이 너무 짧습니다.';
    }
    else {}
    return '닉네임의 길이는 10이하입니다.';
  }

  String validationEmail(String val){
    if(
    RegExp(r'[ㄱ-ㅎㅏ-ㅣ가-힣]').hasMatch(val)
    ) {
      return '이메일에 한글은 사용할 수 없습니다.';
    }
    else {
      if((val.contains('@') && val.contains('.') && !RegExp(r'[ㄱ-ㅎㅏ-ㅣ가-힣]').hasMatch(val)) || val == ''){
        return '';
      }
      else {
        if(val.contains('@')){
          return '도메인을 확인해주세요';
        }
        else if( val.contains('.')) {
          return '도메인 미입력';
        }
        else {
          return '올바른 이메일 형식이 아닙니다. (도메인 없음)';
        }

      }

    }
  }

  String validatePw(String pw1, String pw2){
    bool validate1 = RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*(),.\-_+=]{5,}$').hasMatch(pw1);
    bool validate2 = RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*(),.\-_+=]{5,}$').hasMatch(pw2);

    if(pw1.isEmpty && pw2.isEmpty){
      return '';
    }
    else if( validate1 && validate2 &&
        pw1 == pw2 &&
        pw1.length <= 20 &&
        pw2.length <= 20) {
      return '';

    }
    else if(validate1 &&
        validate2 &&
        pw1 != pw2 &&
        pw1.length <= 20 &&
        pw2.length <= 20) {
        return '비밀번호가 일치하지 않습니다.';
    }

    else if(!validate1 ){
      return '비밀번호의 조건이 충족되지 않습니다.';
    }

    else if(validate1 && !validate2 ){
      return '비밀번호 확인의 조건이 충족되지 않습니다.';
    }

    else{
      return '비밀번호의 길이가 너무 깁니다.';
    }

  }

}