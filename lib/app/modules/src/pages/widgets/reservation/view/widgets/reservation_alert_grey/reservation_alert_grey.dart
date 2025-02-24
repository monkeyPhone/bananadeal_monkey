import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../../../../../routes/const/const_info.dart';
import '../../../controller/reservation_controller.dart';

class ReservationAlertGrey extends GetView<ReservationController> {
  final int joinTkIdx;
  const ReservationAlertGrey({
    super.key,
    required this.joinTkIdx,
  });

  @override
  Widget build(BuildContext context) {

    ({String a, String b, String c, String d}) recordStringMe = switch(joinTkIdx){
      1 =>
       (
        a: '[ 개통자가 "성인"인 경우 ]',
        b: '본인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n단, 가입자와 예금주가 다를 경우 예금주 신분증 함께 지참\n* 가족결합, 복지할인 등 가입 조건에 따라 추가 필요서류는 방문 판매점에 문의',
        c: '[ 개통자가 "법인"인 경우 ]',
        d: '대표자 신분증, 사업자등록증\n* 상황에 따라 추가 필요서류는 방문 판매점에 문의'
       ),
      2 =>
       (
        a: '[ 개통자가 "성인"인 경우 ]',
        b: '본인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n단, 가입자와 예금주가 다를 경우 예금주 신분증 함께 지참\n* 가족결합, 복지할인 등 가입 조건에 따라 추가 필요서류는 방문 판매점에 문의',
        c: '[ 개통자가 "법인"인 경우 ]',
        d: '대표자 신분증, 사업자등록증\n* 상황에 따라 추가 필요서류는 방문 판매점에 문의'
       ),
      3 =>
       (
        a: '[ 개통자가 "성인"인 경우 ]',
        b: '본인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n단, 가입자와 예금주가 다를 경우 예금주 신분증 함께 지참\n* 가족결합, 복지할인 등 가입 조건에 따라 추가 필요서류는 방문 판매점에 문의',
        c: '[ 개통자가 "법인"인 경우 ]',
        d: '대표자 신분증, 사업자등록증\n* 상황에 따라 추가 필요서류는 방문 판매점에 문의'
       ),
      4 =>
       (
         a: '[ 개통자가 "성인"인 경우 ]',
         b: '본인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n* 가입 조건에 따라 추가 필요서류는 방문 판매점에 문의',
         c: '',
         d: ''),
      5 =>
       (
         a: '[ 개통자가 "성인"인 경우 ]',
         b: '본인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n단, 가입자와 예금주가 다를 경우 예금주 신분증 함께 지참\n* 가입 조건에 따라 추가 필요서류는 방문 판매점에 문의',
         c: '[ 개통자가 "법인"인 경우 ]',
         d: '대표자 신분증, 사업자등록증\n* 상황에 따라 추가 필요서류는 방문 판매점에 문의'
       ),
      6 =>
       (
         a: '[ 개통자가 "성인"인 경우 ]',
         b: '본인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n단, 가입자와 예금주가 다를 경우 예금주 신분증 함께 지참\n* 가입 조건에 따라 추가 필요서류는 방문 판매점에 문의',
         c: '[ 개통자가 "법인"인 경우 ]',
         d: '대표자 신분증, 사업자등록증\n* 상황에 따라 추가 필요서류는 방문 판매점에 문의'
       ),
      8 =>
       (
        a: '[ 개통자가 "성인"인 경우 ]',
        b: '본인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n단, 가입자와 예금주가 다를 경우 예금주 신분증 함께 지참\n* 가입 조건에 따라 추가 필요서류는 방문 판매점에 문의',
        c: '[ 개통자가 "법인"인 경우 ]',
        d: '대표자 신분증, 사업자등록증, 통장 사본, 인감증명서\n* 상황에 따라 추가 필요서류는 방문 판매점에 문의'
       ),
      12 =>
       (
        a: '[ 개통자가 "성인"인 경우 ]',
        b: '본인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n단, 가입자와 예금주가 다를 경우 예금주 신분증 함께 지참\n* 결합 등 가입 조건에 따라 추가 필요서류는 방문 판매점에 문의',
        c: '[ 개통자가 "법인"인 경우 ]',
        d: '대표자 신분증, 사업자등록증, 통장 사본, 인감증명서\n* 상황에 따라 추가 필요서류는 방문 판매점에 문의'
       ),
     _ =>
       (
         a: '[ 개통자가 "성인"인 경우 ]',
         b: '본인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n단, 가입자와 예금주가 다를 경우 예금주 신분증 함께 지참\n* 가족결합, 복지할인 등 가입 조건에 따라 추가 필요서류는 방문 판매점에 문의',
         c: '[ 개통자가 "법인"인 경우 ]',
         d: '대표자 신분증, 사업자등록증\n* 상황에 따라 추가 필요서류는 방문 판매점에 문의'
       ),
    };
    ({String a, String b, String c, String d}) recordStringOther = switch(joinTkIdx){
      1 =>
        (
          a: "[ 개통자가 '미성년자'로 법정대리인 방문 시 ]",
          b: '법정대리인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n* 전산에서 법정대리인이 확인 불가능한 경우 가족관계 증명서 추가 제출 필요',
          c: "[ 개통자가 '법인'으로 대리인이 방문 시 ]",
          d: '① 또는 ② 택 1 선택\n① 법인인감증명서, 위임장(법인인감 날인), 사업자등록증, 대리인 신분증\n② 법인위임공문(대표자 or 기관정명), 사업자등록증, 대리인 신분증'
        ),
      2 =>
        (
          a: "[ 개통자가 '미성년자'로 법정대리인 방문 시 ]",
          b: '법정대리인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n* 전산에서 법정대리인이 확인 불가능한 경우 가족관계 증명서 추가 제출 필요',
          c: "[ 개통자가 '법인'으로 대리인이 방문 시 ]",
          d: '법인인감증명서, 위임장(법인인감 날인 또는 공문), 사업자등록증, 대리인 신분증'
      ),
      3 =>
       (
        a: "[ 개통자가 '미성년자'로 법정대리인 방문 시 ]",
        b: '법정대리인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n* 전산에서 법정대리인이 확인 불가능한 경우 가족관계 증명서, 법정대리인 책임 확약서 추가 제출 필요',
        c: "[ 개통자가 '법인'으로 대리인이 방문 시 ]",
        d: '법인인감증명서, 위임장(법인인감 날인), 사업자등록증, 대리인 신분증'
       ),
      4 =>
        (
          a: "[ 개통자가 '미성년자'로 법정대리인 방문 시 ]",
          b: '법정대리인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n* 전산에서 법정대리인이 확인 불가능한 경우 가족관계 증명서 추가 제출 필요',
          c: '',
          d: ''
        ),
      5 =>
       (
        a: "[ 개통자가 '미성년자'로 법정대리인 방문 시 ]",
        b: '법정대리인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n* 전산에서 법정대리인이 확인 불가능한 경우 가족관계 증명서 추가 제출 필요',
        c: "[ 개통자가 '법인'으로 대리인이 방문 시 ]",
        d: '법인인감증명서, 위임장(법인인감 날인), 사업자등록증, 대리인 신분증'
       ),
      6 =>
       (
        a: "[ 개통자가 '미성년자'로 법정대리인 방문 시 ]",
        b: '법정대리인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n* 전산에서 법정대리인이 확인 불가능한 경우 가족관계 증명서 추가 제출 필요',
        c: "[ 개통자가 '법인'으로 대리인이 방문 시 ]",
        d: '법인인감증명서, 위임장(법인인감 날인), 사업자등록증, 대리인 신분증, 대표자 신분증'
       ),
      8 =>
       (
        a: "[ 개통자가 '미성년자'로 법정대리인 방문 시 ]",
        b: '법정대리인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n* 전산에서 법정대리인이 확인 불가능한 경우 가족관계 증명서 또는 등본 추가 제출 필요',
        c: "[ 개통자가 '법인'으로 대리인이 방문 시 ]",
        d: '위임장 또는 공문(법인인감 날인), 대리인 신분증'
       ),
      12 =>
       (
        a: "[ 개통자가 '미성년자'로 법정대리인 방문 시 ]",
        b: '법정대리인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n* 전산에서 법정대리인이 확인 불가능한 경우 가족관계 증명서 또는 등본 추가 제출 필요',
        c: "[ 개통자가 '법인'으로 대리인이 방문 시 ]",
        d: '위임장 또는 공문(법인인감 날인), 대리인 신분증'
       ),
      _ =>
        (
          a: '[ 개통자가 "미성년자"로 법정대리인 방문 시 ]',
          b: '법정대리인 신분증(주민등록증, 운전면허증, 주민등록증 발급 신청 확인서)\n* 전산에서 법정대리인이 확인 불가능한 경우 가족관계 증명서 추가 제출 필요',
          c: '[ 개통자가 "법인"으로 대리인이 방문 시 ]',
          d: '법인인감증명서, 위임장(법인인감 날인), 사업자등록증, 대리인 신분증'
        ),
    };

    return Padding(
      padding: EdgeInsets.only(
        bottom: WidgetSize(context).sizedBox16,
        left: WidgetSize(context).sizedBox16,
        right: WidgetSize(context).sizedBox16,
      ),
      child: SizedBox(
        width: WidgetSize(context).widthCommon,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text('※ 개통자 본인 방문 시 꼭 챙겨가야할 구비서류 확인하세요.',
                style: TextStyle(
                    color: Style.blackWrite,
                    fontSize: WidgetSize(context).sizedBox18,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(
                height: WidgetSize(context).sizedBox12
            ),
            ObxValue(
                    (people) =>
                        switch(people.value){
                           InfoString.reservationOther =>
                            _ReserVationAlertGreyContainer(
                              text1: recordStringOther.a,
                              text2: recordStringOther.b,
                              text3: recordStringOther.c,
                              text4: recordStringOther.d,
                            ),
                           _ =>
                            _ReserVationAlertGreyContainer(
                              text1: recordStringMe.a,
                              text2: recordStringMe.b,
                              text3: recordStringMe.c,
                              text4: recordStringMe.d,
                            )
                        }
                , controller.reservationPeople)
          ],
        ),
      ),
    );
  }
}


class _ReserVationAlertGreyContainer extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  const _ReserVationAlertGreyContainer({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
      color: Style.greyEAEAEA,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         _containerColumn(
             context: context,
             text1: text1,
             text2: text2
         ),
          SizedBox(
            height: WidgetSize(context).sizedBox16,
          ),
          _containerColumn(
              context: context,
              text1: text3,
              text2: text4
          )
        ],
      ),
    );
  }

  Widget _containerColumn({
    required BuildContext context,
    required String text1,
    required String text2
  }){
    return text1 == '' ? SizedBox()
        : Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text1,
          style: TextStyle(
              color: Style.blackWrite,
              fontSize: WidgetSize(context).sizedBox16,
              fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(
          height: WidgetSize(context).sizedBox4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('- ',
              style: TextStyle(
                  color: Style.blackWrite,
                  fontSize: WidgetSize(context).sizedBox16,
                  fontWeight: FontWeight.w400
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text2,
                    style: TextStyle(
                        color: Style.blackWrite,
                        fontSize: WidgetSize(context).sizedBox15,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

}

