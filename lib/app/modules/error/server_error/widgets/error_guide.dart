import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../css/size.dart';
import '../../../../css/style.dart';

  class ErrorGuide extends StatelessWidget {
    final int statusCode;
    const ErrorGuide({
      required this.statusCode,
      super.key});

    @override
    Widget build(BuildContext context) {

      const String commonText1 = '서버와의 연결에 성공하면';
      const String commonText2 = '이전 페이지로 자동전환됩니다.';

      return
        statusCode == 504 ?
        _caseColumn(
            boldText: '페이지 없음',
            normalText1: '서버에 요청한 데이터가 존재하지 않거나',
            normalText2: '캐시 데이터가 유효하지 않습니다.',
            normalText3: '',
            greyText1: '로그인 중이 아니라면 ',
            greyText2: '앱이 종료됩니다.'
        )
            :
        statusCode == 500 ?
        _caseColumn(
            boldText: '서버 연결 실패',
            normalText1: '클라이언트 응답이 없습니다.',
            normalText2: '',
            normalText3: '',
            greyText1: commonText1,
            greyText2: commonText2
        )
            :
        statusCode == 505 ?
        _caseColumn(
            boldText: '서버 연결 실패',
            normalText1: '클라이언트 응답이 없습니다.',
            normalText2: '',
            normalText3: '',
            greyText1: commonText1,
            greyText2: commonText2
        )
            :
        statusCode == 510 ?
        _caseColumn(
            boldText: '서비스 점검중',
            normalText1: '06:00 ~ 07:00 에는',
            normalText2: '정기 서비스 점검 시간으로',
            normalText3: '이용이 불가능합니다.',
            greyText1: '서비스 점검 이후',
            greyText2: '접속 부탁드립니다.'
        )
            :
        _caseColumn(
            boldText: '서버 연결 지연',
            normalText1:'현재 서버 요청 횟수가 많거나',
            normalText2: '네트워크 상태가 불안정합니다.',
            normalText3: '',
            greyText1: commonText1,
            greyText2: commonText2
        );
    }

    Widget _caseColumn({
      required String boldText,
      required String normalText1,
      required String normalText2,
      required String normalText3,
      required String greyText1,
      required String greyText2
    }){
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(),
          boldText != '' ? _boldText(boldText) : SizedBox(),
          Column(
            children: [
              _normalText(normalText1),
              _normalText(normalText2),
              normalText3 != '' ?_normalText(normalText3) : SizedBox(),
            ],
          ),

          Column(
            children: [
              _greyText(greyText1),
              _greyText(greyText2),
            ],
          ),
          SizedBox(),
        ],
      );
    }

    Widget _boldText(String text){
      return  Text(text,
        style: TextStyle(
          color: Style.blackWrite,
          fontSize: WidgetSize(Get.context!).sizedBox35,
          fontWeight: FontWeight.w700,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    Widget _normalText(String text){
      return  Text(text,
        style: TextStyle(
          color: Style.blackWrite,
          fontSize: WidgetSize(Get.context!).sizedBox20,
          fontWeight: FontWeight.normal,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    Widget _greyText(String text){
      return  Text(text,
        style: TextStyle(
          color: Style.ultimateGrey,
          fontSize: WidgetSize(Get.context!).sizedBox20,
          fontWeight: FontWeight.normal,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

  }


