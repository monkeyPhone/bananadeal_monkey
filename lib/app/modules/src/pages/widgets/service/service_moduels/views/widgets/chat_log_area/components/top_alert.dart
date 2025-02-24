import 'package:banana_deal_by_monkeycompany/app/components/disable_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/sub_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/nav/deal/deal_estimate.dart';
import '../../../../../../../../../../routes/const_element.dart';
import '../../../../../../../../src_components/controllers/src_route_controller.dart';
import '../../../../controllers/chat_log_controller.dart';


class TopAlert extends GetView<ChatLogController> {
  final DealEstimateList est;
  const TopAlert({
    required this.est,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String formatNumber(text){
      return NumberFormat('###,###').format(text);
    }
    return GetBuilder<ChatWidgetController>(
        builder: (cwc) =>
            GestureDetector(
              onTap: () async{
                if(MediaQuery.of(context).viewInsets.bottom > 0){
                  FocusScope.of(context).unfocus();
                }
                // Banana fix 차장님한테 전체화면에 걸지 작은 화면에 걸지 물어보기.
                est.dePsName == ''
                    ? await controller.refreshInfo()
                    : cwc.changeDetail(cwc.detail.value =! cwc.detail.value);
              },
              child: Container(
                color: Style.white,
                padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox8),
                      height: WidgetSize(context).sizedBox1_5, color: Style.greyEAEAEA,),
                    Padding(
                      padding: EdgeInsets.all(WidgetSize(context).sizedBox12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  est.dePsName,
                                  style: TextStyle(
                                    fontSize: WidgetSize(context).sizedBox19,
                                    fontWeight: FontWeight.w700,
                                    color: Style.blackWrite,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                cwc.detail.value
                                    ?  SizedBox()
                                    :  SizedBox(height: WidgetSize(context).sizedBox12,),
                                cwc.detail.value
                                    ?  SizedBox()
                                    :  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(

                                          est.deInstallmentPrincipal <= 0
                                              ? '0원'
                                              : '${formatNumber(est.deInstallmentPrincipal)}원',

                                          style: TextStyle(
                                            fontSize: WidgetSize(context).sizedBox18,
                                            fontWeight: FontWeight.w400,
                                            color: Style.blackWrite,
                                          ),
                                        ),
                                        SizedBox(width: WidgetSize(context).sizedBox7_5),
                                        Text(
                                          '/',
                                          style: TextStyle(
                                            fontSize: WidgetSize(context).sizedBox18,
                                            fontWeight: FontWeight.w400,
                                            color: Style.blackWrite,
                                          ),
                                        ),
                                        SizedBox(width: WidgetSize(context).sizedBox7_5),
                                        Text(
                                          '${formatNumber(est.deMonthTotalPrice)}원',
                                          style: TextStyle(
                                            fontSize: WidgetSize(context).sizedBox18,
                                            fontWeight: FontWeight.w400,
                                            color: Style.blackWrite,
                                          ),
                                        ),
                                        SizedBox(width: WidgetSize(context).sizedBox8),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: WidgetSize(context).sizedBox12,),
                          GestureDetector(
                            onTap: (){
                              if(MediaQuery.of(context).viewInsets.bottom > 0){
                                FocusScope.of(context).unfocus();
                              }
                              controller.estimateList.first.dePsName == ''
                                  ? controller.refreshInfo()
                                  : cwc.changeDetail(cwc.detail.value =! cwc.detail.value);
                            },
                            child: Icon(
                              controller.estimateList.first.dePsName == ''
                                  ? Icons.refresh
                                  : !cwc.detail.value
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up
                              , color: Style.blackWrite,
                              size: WidgetSize(context).sizedBox30,
                            ),
                          )
                        ],
                      ),
                    ),
                    !cwc.detail.value
                        ? SizedBox()
                        : Container(
                          color: Style.white,
                          constraints: BoxConstraints(
                            maxHeight: WidgetSize(context).heightCommon*0.45
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Scrollbar(
                                  thumbVisibility: true,
                                  controller: controller.barController,
                                  child: SingleChildScrollView(
                                    physics: ScrollPhysics(),
                                    controller: controller.barController,
                                    child: Column(
                                      children: [
                                    Container(
                                      color: Style.white,
                                      child: Padding(
                                        padding: WidgetSize(context).paddingBodyWhole,
                                        child: Column(
                                          children: [
                                            SizedBox(height: WidgetSize(context).sizedBox12,),
                                            _topRowText(text1: '출고가', text2: '${formatNumber(est.deFactoryPrice)}원', context: context),
                                            est.deSupportType != "GONGSI"
                                                ? SizedBox()
                                                : _topRowText(
                                                context: context, text1: AppElement.pay1,
                                                text2:
                                                est.deSupportPrice == 0
                                                    ? '0원'
                                                    :  est.deSupportPrice == 18
                                                    ? '확인불가'
                                                    : '-${formatNumber(est.deSupportPrice)}원',
                                                color: est.deSupportPrice == 0 || est.deSupportPrice == 18  ? Style.blackWrite : Style.red),
                                            est.deAddSupportPrice >= 1 && est.deSupportType == "GONGSI"
                                                ? _topRowText(context: context,text1: AppElement.pay2, text2: '-${formatNumber(est.deAddSupportPrice)}원', color: Style.red)
                                                : SizedBox(),
                                            est.deTransYN == 'Y' && est.deSupportType == "GONGSI" && est.deTransPrice != 8
                                                ? _topRowText(context: context,text1: AppElement.pay3,
                                                text2: est.deTransPrice == 18
                                                    ? '확인불가' : '-${formatNumber(est.deTransPrice)}원', color: est.deTransPrice == 18 ? Style.blackWrite : Style.red)
                                                : SizedBox(),
                                            est.deAddTransPrice >= 1 && est.deSupportType == "GONGSI"
                                                ? _topRowText(context: context,text1: AppElement.pay4, text2: '-${formatNumber(est.deAddTransPrice)}원', color: Style.red)
                                                : SizedBox(),
                                            _topRowText(context: context,text1: '기타할인', text2: est.deSale == 0 ? '0원' : '-${formatNumber(est.deSale)}원', color: est.deSale == 0 ? Style.blackWrite : Style.red),

                                            (est.deTransPrice >= 1 && est.deAddTransPrice >= 1) && est.deSupportType == "GONGSI"
                                                ? SizedBox(height: WidgetSize(context).sizedBox12,)
                                                : const SizedBox(),

                                            est.deInstallmentMonth == 0 && est.deCash >= 1
                                                ?
                                            _topRowText(context: context,
                                                text1:
                                                '현금',
                                                text2: '${formatNumber(
                                                    est.deCash)}원')
                                                : est.deInstallmentMonth != 0
                                                ?  _topRowText(context: context,
                                                text1: '할부원금',
                                                text2: '${formatNumber(est.deInstallmentPrincipal)}원')
                                                : SizedBox(),
                                            _topRowText(context: context,text1: '할부개월', text2:  est.deInstallmentMonth == 0  ? '현금개통' :'${est.deInstallmentMonth}개월'),
                                            // estimate.deFactoryPrice - estimate.deSale
                                            est.deInstallmentMonth == 0
                                                ? SizedBox()
                                                :
                                            est.deInstallmentInterest >= 1
                                                ? _topRowText(context: context,text1: '할부이자', text2: '${formatNumber(est.deInstallmentInterest)}원')
                                                : SizedBox(),
                                            SizedBox(
                                              height: est.deInstallmentMonth == 0 || est.deInstallmentInterest < 1
                                                  ? 0
                                                  : WidgetSize(context).sizedBox12,
                                            ),
                                            _topRowText(context: context,text1: '월 할부금', text2: '${formatNumber(est.deInstallmentMonthPrice)}원'),
                                            SizedBox(height: WidgetSize(context).sizedBox20,),
                                            _topRowTextMax(context: context,text1: est.dePlan, text2: ''),
                                            SizedBox(height: WidgetSize(context).sizedBox12,),
                                            _topRowText(context: context,text1: '요금제 기본료', text2: '${formatNumber(est.dePlanBasic)}원'),
                                            est.deSupportType != "CHOICE"
                                                ? SizedBox()
                                                : _topRowText(context: context,text1: '선택약정할인', text2: est.deOptionalSale == 0 ? '0원' :'-${formatNumber(est.deOptionalSale)}원', color: Style.red),
                                            est.deSupportType != "CHOICE" || est.deOptionalMonth == ''
                                                ? SizedBox()
                                                : est.deOptionalMonth == '0'
                                                ? _topRowText(context: context,text1: '선택약정개월', text2: '무약정',)
                                                : _topRowText(context: context,text1: '선택약정개월', text2: '${est.deOptionalMonth}개월',),
                                            // Column(
                                            //     children: [...List.generate(est.dePromotionName.length, (index) =>
                                            //     index == 0
                                            //         ?  _topRowText(
                                            //               text1: '기타할인',
                                            //               text2:
                                            //               int.parse(est.dePromotionSale[0])+int.parse(est.dePromotionSale[1])+int.parse(est.dePromotionSale[2]) == 0
                                            //               ? '0'
                                            //               : '-${formatNumber(int.parse(est.dePromotionSale[0])+int.parse(est.dePromotionSale[1])+int.parse(est.dePromotionSale[2]))}원',
                                            //               color: int.parse(est.dePromotionSale[0])+int.parse(est.dePromotionSale[1])+int.parse(est.dePromotionSale[2]) == 0
                                            //                         ? Style.blackWrite
                                            //                         : Style.red
                                            //     )
                                            //         : SizedBox(),
                                            //     )]
                                            // ),
                                            est.deAgreementSale >= 1
                                                ? _topRowText(context: context,text1: '요금약정할인', text2: '-${formatNumber(est.deAgreementSale)}원', color: Style.red)
                                                : SizedBox(),
                                            est.deWelfareSale >= 1
                                                ? _topRowText(context: context,text1: '복지할인', text2: '-${formatNumber(est.deWelfareSale)}원', color: Style.red)
                                                : SizedBox(),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                                children: [...List.generate(est.dePromotionName.length, (index) =>
                                                est.dePromotionName.isNotEmpty && est.dePromotionSale.isNotEmpty && est.dePromotionName[index] != '' && est.dePromotionSale[index] != '0'
                                                    ? _topRowText(context: context,text1: est.dePromotionName[index], text2: '-${formatNumber(int.parse(est.dePromotionSale[index]))}원', color: Style.red)
                                                    : const SizedBox(),
                                                )]
                                            ),
                                            SizedBox(height: est.deMonthPrice == 0
                                                ? 0
                                                : WidgetSize(context).sizedBox12,),
                                            _topRowText(context: context,text1: '월 요금', text2: '${formatNumber(est.deMonthPrice)}원'),

                                          ],
                                        ),
                                      ),
                                    )

                                                          ],
                                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: WidgetSize(context).paddingBodyWhole,
                                child: est.dStatus != 'PARTICIPATE'
                                    ? SizedBox()
                                    : Column(
                                  children: [
                                    SizedBox(height: WidgetSize(context).sizedBox20,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: WidgetSize(context).sizedBox12
                                      ),
                                      child: _topRowText2(
                                          context: context,
                                          text1: '월 납부요금',
                                          text2: '${formatNumber(est.deMonthTotalPrice)}원'
                                      ),
                                    ),
                                    SizedBox(height: WidgetSize(context).sizedBox20,),
                                    !controller.loading.value
                                        ? SubButton(
                                      onTap: () {
                                        controller.setReservationValue(co: context, es: est);
                                        SrcRouteController.to.gotoReservation(
                                            smid: est.deSmMId,
                                            joinTkIdx: est.deJoinTkIdx
                                        );
                                      },
                                      backGroundColor: Style.yellow,
                                      textColor: Style.brown,
                                      text: '딜 수락하기',
                                      textSize: WidgetSize(context).sizedBox17,
                                      height: WidgetSize(context).sizedBox50,
                                    )
                                        : DisableButton(text: '딜 수락하기'),
                                    SizedBox(
                                        height: WidgetSize(context).sizedBox18),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                  ],
                ),
              ),
            )
    );
  }

  Widget _topRowText2({required String text1, required String text2, required BuildContext context}){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1, style: TextStyle(
            fontSize: WidgetSize(context).sizedBox18,
            fontWeight: FontWeight.w700,
            color: Style.red
        ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '(VAT 포함)', style: TextStyle(
                fontSize: WidgetSize(context).sizedBox18,
                fontWeight: FontWeight.w400,
                color: Style.red
            ),
            ),
            SizedBox(
              width: WidgetSize(context).sizedBox4,
            ),
            Text(
              text2, style: TextStyle(
                fontSize: WidgetSize(context).sizedBox24,
                fontWeight: FontWeight.w700,
                color: Style.red
            ),
            ),
          ],
        )
      ],
    );
  }

  Widget _topRowText({required String text1, required String text2, Color? color, required BuildContext context}){
    return  Padding(
      padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox7_5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1, style: TextStyle(
              fontSize: WidgetSize(context).sizedBox18,
              fontWeight: FontWeight.w700,
              color: Style.blackWrite
          ),
          ),
          Text(
            text2, style: TextStyle(
              fontSize: WidgetSize(context).sizedBox18,
              fontWeight: FontWeight.w400,
              color: color ?? Style.blackWrite
          ),
          )
        ],
      ),
    );
  }

  Widget _topRowTextMax({required String text1, required String text2, Color? color, required BuildContext context}){
    return  Padding(
      padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox7_5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1, style: TextStyle(
              fontSize: WidgetSize(context).sizedBox20,
              fontWeight: FontWeight.w700,
              color: Style.blackWrite
          ),
          ),
          Text(
            text2, style: TextStyle(
              fontSize: WidgetSize(context).sizedBox18,
              fontWeight: FontWeight.w400,
              color: color ?? Style.blackWrite
          ),
          )
        ],
      ),
    );
  }

}
