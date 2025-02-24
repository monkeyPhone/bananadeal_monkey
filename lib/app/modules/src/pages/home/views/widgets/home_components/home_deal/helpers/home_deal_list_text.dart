import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../models/nav/deal/deal_estimate.dart';


class HomeDealListText extends StatelessWidget {
  final DealEstimateList estimate;
  final int caseRoute;

  const HomeDealListText({
    Key? key,
    required this.estimate,
    required this.caseRoute
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {


    String switchEstimateSupType(){
      switch(estimate.deSupportType){
        case 'CHOICE':
          return '선택약정';
        case 'GONGSI':
          return '공시지원';
        default:
          return '협의';
      }
    }
    String formatNumber(text){
      return NumberFormat('###,###').format(text);
    }

    Widget _pad(){
      return SizedBox(
        height: WidgetSize(context).sizedBox2,
      );
    }

    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  lineText(estimate.smStoreName, context),
                  _pad(),
                  lineText2(
                    text1: '${estimate.dePsName}',
                    text2: switchEstimateSupType(),
                    text3: estimate.deInstallmentMonth == 0 ? '현금구매' :  '${estimate.deInstallmentMonth}개월',
                    context: context
                  )
                ],
              ),
            ),

            Flexible(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  lineText3(
                    formatNumber(
                        caseRoute == 0
                            ?  estimate.deMonthTotalPrice
                            :  estimate.deInstallmentPrincipal

                    )
                  , context),
                  _pad(),
                  lineText4('${
                  formatNumber(
                  estimate.deSale)
                  }원 매장할인', context)
                ],
              ),
            ),

          ],
        )
      ],
    );
  }

  Widget modelText(BuildContext context){
    return Text('휴대폰 모델명', style: TextStyle(
        fontSize: WidgetSize(context).sizedBox15
    ),);
  }

  Widget noticeText(String text, BuildContext context){
    return Text(text, style: TextStyle(
      fontWeight: FontWeight.w700,
      color: Style.blackWrite,
      fontSize: WidgetSize(context).sizedBox20,
    ),);
  }

  Widget lineText(String text, BuildContext context){
    return Text(text, style: TextStyle(
      fontWeight: FontWeight.w700,
      color: Style.brown,
      fontSize: WidgetSize(context).sizedBox16,
    ),
      textAlign: TextAlign.left,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget lineText2({text1, text2, text3, required BuildContext context}){
    return Text(
      '$text1/$text2/$text3'
    , style: TextStyle(
      fontWeight: FontWeight.w700,
      color: Style.brown.withOpacity(0.5),
      fontSize: WidgetSize(context).sizedBox12,
    ),
      textAlign: TextAlign.left,
    );
  }



  Widget lineText3(String text, BuildContext context){
    return Text(text+'원', style: TextStyle(
      fontWeight: FontWeight.w700,
      color: Style.brown,
      fontSize: WidgetSize(context).sizedBox22,
    ),
      textAlign: TextAlign.right,
    );
  }

  Widget lineText5(String text, BuildContext context){
    return Text(text, style: TextStyle(
      fontWeight: FontWeight.w700,
      color: Style.red.withValues(alpha: 0.75),
      fontSize: WidgetSize(context).sizedBox14,
    ),);
  }

  Widget lineText4(String text, BuildContext context){
    return Text(text, style: TextStyle(
      fontWeight: FontWeight.w700,
      color:  Style.red.withValues(alpha: 0.75),
      fontSize: WidgetSize(context).sizedBox12,
    ),
      textAlign: TextAlign.right,
    );
  }

  Widget nullSpace(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).sizedBox15,
    );
  }

  Widget nullSpace2(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).width005,
    );
  }

}
