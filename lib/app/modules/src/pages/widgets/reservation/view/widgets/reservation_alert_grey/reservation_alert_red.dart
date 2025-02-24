import 'package:flutter/material.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class ReservationAlertRed extends StatelessWidget {
  const ReservationAlertRed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: WidgetSize(context).sizedBox8,
        left: WidgetSize(context).sizedBox16,
        right: WidgetSize(context).sizedBox16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('※ 유의사항',
            style: TextStyle(
                color: Style.cocacolaRed,
                fontSize: WidgetSize(context).sizedBox18,
                fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox8,
          ),
          _ReserVationAlertRedContainer()
        ],
      ),
    );
  }
}


class _ReserVationAlertRedContainer extends StatelessWidget {
  const _ReserVationAlertRedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox16, horizontal: WidgetSize(context).sizedBox10),
      color: Style.greyEAEAEA,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         _containerColumn(
             context: context,
             text1: '①',
             text2: '매장에서 보낸 견적은 통신사 정책에 따라 변경될 수 있어, 빠른 시일 내에 매장으로 방문바랍니다.'
         ),
          SizedBox(
            height: WidgetSize(context).sizedBox10,
          ),
          _containerColumn(
              context: context,
              text1: '②',
              text2: '방문 일정 미설정 하거나 매장 영업시간이 아닌 경우 매장에서 고객님께서 작성해주신 연락처로 연락이 갈 수 있습니다.'
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox10,
          ),
          _containerColumn(
              context: context,
              text1: '③',
              text2: '가입조건 변경 및 가입 관련 문의는 방문 매장을 통해 상담해 주시기 바랍니다.'
          ),
        ],
      ),
    );
  }

  Widget _containerColumn({
    required BuildContext context,
    required String text1,
    required String text2
  }){
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text1,
            style: TextStyle(
                color: Style.blackWrite,
                fontSize: WidgetSize(context).sizedBox16,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(
            width: WidgetSize(context).sizedBox5,
          ),
          Expanded(
            child: Text(text2,
              style: TextStyle(
                  color: Style.blackWrite,
                  fontSize: WidgetSize(context).sizedBox15,
                  fontWeight: FontWeight.w400
              ),
            ),
          )
        ],
      ),
    );
  }

}

