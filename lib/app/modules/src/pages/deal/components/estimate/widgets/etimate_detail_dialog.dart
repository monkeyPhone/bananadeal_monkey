import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/nav/deal/deal_status.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_route_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const/const_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../models/nav/deal/deal_estimate.dart';
import '../../../../../../../routes/const_element.dart';
import '../../../../widgets/service/chat_service_controller.dart';
import '../estimate_controller.dart';

class OpenDialog{
  static final ScrollController sController = ScrollController();

  static openDialog({required BuildContext routerContext,
    required DealStatusList currentDeal,
    required DealEstimateList estimate, bool? ro, bool? confirm}){
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
    
    List<String> formatIntList(List<String> stringList){
      List<int> convertInt = stringList.map((text) => int.tryParse(text) ?? 0).toList();
      return convertInt.map((e) => NumberFormat('###,###,###,###').format(e)).toList();
    }


    String convertStatus(String text){
      return switch(text){
        'OPEN' => InfoString.dealStatusOpen,
        'ACCEPT' => InfoString.dealStatusAcp,
        _ => InfoString.dealStatusEnd,
      };
    }


    String formatNumber(text){
      return NumberFormat('###,###').format(text);
    }

    String switchEstimateJoinTkIdx(){
      switch(estimate.deJoinTkIdx){
        case 1:
          return 'SK';
        case 2:
          return 'KT';
        case 3:
          return 'LG';
        case 4:
          return '7모바일';
        case 5:
          return 'M모바일';
        case 6:
          return 'U모바일';
        case 8:
          return 'Hello모바일 (KT망)';
        case 12:
          return 'Hello모바일 (LG망)';
        case 14:
          return '기타';
        default:
          return '협의';
      }
    }

    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: routerContext,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              Dialog(
                backgroundColor: Style.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox12))
                ),
                child: SizedBox(
                    width: WidgetSize(context).widthCommon,
                    height: WidgetSize(context).heightCommon,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: WidgetSize(context).sizedBox12,
                              left:WidgetSize(context).sizedBox12,
                              right:WidgetSize(context).sizedBox3
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('견적 상세보기', style:TextStyle(
                                  fontSize: WidgetSize(context).sizedBox24,
                                  fontWeight: FontWeight.w700,
                                  color: Style.blackWrite
                              ),),
                              RippleIconButton(
                                  onTap: (){
                                    Get.back();
                                  },
                                  icon: Icons.close,
                                  iconColor: Style.blackWrite)
                              // GestureDetector(
                              //   onTap: (){
                              //     Get.back();
                              //   },
                              //   child: Icon(Icons.close, size: WidgetSize(context).sizedBox34+WidgetSize(context).sizedBox5, color: Style.blackWrite,),
                              // )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Scrollbar(
                            controller: sController,
                            thumbVisibility: true,
                            child: ListView(
                              controller: sController,
                              physics: const ClampingScrollPhysics(),
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(height: WidgetSize(context).sizedBox8,),
                                    Container(
                                      color: Colors.transparent,
                                      padding: EdgeInsets.only(top: WidgetSize(context).sizedBox6, bottom: WidgetSize(context).sizedBox12, left: WidgetSize(context).sizedBox12, right: WidgetSize(context).sizedBox15),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          _area1(
                                              context: context,
                                              deType: estimate.deType,
                                              deJoinTkIdx: switchEstimateJoinTkIdx(),
                                              deSupportType: switchEstimateSupType(),
                                              deContractPlan: estimate.deContractPlan,
                                              deInstallmentMonth: '${estimate.deInstallmentMonth}'),
                                          SizedBox(height: WidgetSize(context).sizedBox25,),
                                          _area2(
                                              context: context,
                                              deSupportType: estimate.deSupportType,
                                              deSupportPrice: estimate.deSupportPrice > 0 ? '${formatNumber(estimate.deSupportPrice)}' : '${estimate.deSupportPrice}',
                                              deAddSupportPrice: estimate.deAddSupportPrice > 0 ? '${formatNumber(estimate.deAddSupportPrice)}' : '${estimate.deAddSupportPrice}',
                                              deTransPrice: estimate.deTransYN == 'Y' ? '${formatNumber(estimate.deTransPrice)}' : '${estimate.deTransPrice}',
                                              deAddTransPrice: estimate.deAddTransPrice > 0 ? '${formatNumber(estimate.deAddTransPrice)}' : '${estimate.deAddTransPrice}',
                                              dePsName: estimate.dePsName,
                                              deTransYN: estimate.deTransYN,
                                              deFactoryPrice: '${formatNumber(estimate.deFactoryPrice)}',
                                              deSale: estimate.deSale > 0 ? '${formatNumber(estimate.deSale)}' : '${estimate.deSale}',
                                              deInstallmentPrincipal: estimate.deInstallmentMonth == 0
                                                  ? estimate.deCash <= 0
                                                      ? '0'
                                                      : '${formatNumber(estimate.deCash)}'
                                                  : estimate.deInstallmentPrincipal <= 0
                                                      ? '0'
                                                      : '${formatNumber(estimate.deInstallmentPrincipal)}',
                                              deInstallmentInterest: '${formatNumber(estimate.deInstallmentInterest)}',
                                              deInstallmentMonth: '${estimate.deInstallmentMonth}'
                                          ),
                                          estimate.deInstallmentMonth == 0
                                              ? SizedBox()
                                              : Column(
                                            children: [
                                              SizedBox(height: WidgetSize(context).sizedBox20,),
                                              _oneText(text1: '월 할부금' , text2: '${formatNumber(estimate.deInstallmentMonthPrice)}원', context: context),

                                            ],
                                          ),
                                          SizedBox(height: WidgetSize(context).sizedBox25,),
                                          _area3(
                                              context: context,
                                              deOptionalMonth: estimate.deOptionalMonth,
                                              deSupportType: estimate.deSupportType,
                                              dePlan:'${ estimate.dePlan}',
                                              dePlanBasic: '${formatNumber(estimate.dePlanBasic)}',
                                              deOptionalSale: estimate.deOptionalSale > 0 ? '${formatNumber(estimate.deOptionalSale)}' : '${estimate.deOptionalSale}',
                                              deAgreementSale: estimate.deAgreementSale > 0 ? '${formatNumber(estimate.deAgreementSale)}' : '${estimate.deAgreementSale}',
                                              deWelfareSale: estimate.deWelfareSale > 0 ? '${formatNumber(estimate.deWelfareSale)}' : '${estimate.deWelfareSale}',
                                              dePromotionName: estimate.dePromotionName,
                                              dePromotionSale: estimate.dePromotionSale.isNotEmpty ? formatIntList(estimate.dePromotionSale) : []
                                          ),
                                          SizedBox(height: WidgetSize(context).sizedBox20,),
                                          _oneText(text1: '월 요금' , text2: '${formatNumber(estimate.deMonthPrice)}원', context: context),
                                          SizedBox(height: WidgetSize(context).sizedBox25,),
                                          _specialText(text1: '월 납부요금', text2: '${formatNumber(estimate.deMonthTotalPrice)}원', context: context),
                                          SizedBox(height: WidgetSize(context).sizedBox12,),
                                          Container(
                                            width: WidgetSize(context).widthCommon,
                                            height: WidgetSize(context).sizedBox121,
                                            padding: EdgeInsets.symmetric(
                                                vertical: WidgetSize(context).sizedBox8,
                                                horizontal: WidgetSize(context).sizedBox16
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox14),
                                                border: Border.all(width: WidgetSize(context).sizedBox1, color: Style.greyDDDDDD),
                                                color: Style.greyF4F4F4
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  _textB16px400w('${estimate.deSuggestions}', context)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: WidgetSize(context).sizedBox12, right: WidgetSize(context).sizedBox12, top: WidgetSize(context).sizedBox8,
                              bottom: WidgetSize(context).sizedBox16
                          ),
                          child:
                          estimate.dStatus == 'PARTICIPATE' || estimate.dStatus == 'OPEN' || estimate.dStatus == 'ACCEPT'
                              ?


                          ro == true
                              ?
                          SizedBox(
                            height: WidgetSize(context).height60px-WidgetSize(context).sizedBox5,
                            child: Center(child: _textU18px700w('${convertStatus(estimate.dStatus)}된 딜이에요', context)),
                          )
                              :

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _button(
                                context: context,
                                onTap: (){
                                  if(Get.isSnackbarOpen){
                                    Get.back();
                                  } else{
                                    Get.back();
                                    ChatServiceController.to.createChat2(crSmid: estimate.deSmMId, context: Get.context, smName: estimate.smStoreName, message: '',);
                                  }
                                },
                                boxColor: Style.brown,
                                text: '채팅상담',
                                textColor: Style.yellow,
                              ),
                              confirm == true
                                  ?
                              SizedBox()
                                  :
                              GetX<EstimatedController>(
                                  init: EstimatedController(
                                    currentDeal: currentDeal,
                                    commonWidgets: CommonWidgets(),
                                    srcDealRepository: const RegisterManager().getSrcDealRepository(),
                                    srcEstimateRepository: const RegisterManager().getSrcEstimateRepository(),
                                    dealRepository:  const RegisterManager().getDealRepository(),
                                  ),
                                  builder: (esC) {
                                    return
                                      esC.change.value == 0
                                          ?
                                      _button(
                                        context: context,
                                        onTap: () {
                                          SrcRouteController.to.gotoReservation(
                                              smid: estimate.deSmMId,
                                              joinTkIdx: estimate.deJoinTkIdx,
                                              estimate: estimate
                                            // onTap: () async{
                                            //   if(Get.isSnackbarOpen == true){
                                            //     Get.back();
                                            //   } else{
                                            //     esC.change.value = 10;
                                            //     if(estimate.dStatus != 'ACCEPT' && estimate.dStatus == 'PARTICIPATE'){
                                            //       final AuthBagicApi confirm = await SrcDealRepository().sendConfirmDeal(
                                            //           deDidx: estimate.deDIdx,
                                            //           dDiIdx: estimate.deDiIdx,
                                            //           mName: SrcInfoController.to.infoM.value.mName,
                                            //           smMid: estimate.store!.smMId);
                                            //
                                            //       if(confirm.status == 200){
                                            //         Get.back();
                                            //         await SrcDealController.to.getDealData(SrcInfoController.to.infoM.value.mIdx.toInt());
                                            //         await EstimatedController.to.joinRoom(estimate.deSmMId);
                                            //         await SrcDealController.to.getDealEstimate(SrcDealController.to.dealStatus.value.result[0].diIdx);
                                            //         await DealController.to.refreshListEnd(SrcDealController.to.dealStatus.value.result[0].diIdx);
                                            //         await esC.clickChatCunsulting(
                                            //             crSmid: estimate.store!.smMId,
                                            //             storeName: estimate.store!.smStoreName,
                                            //             context: context
                                            //         );
                                            //       } else{
                                            //         if(confirm.status == 402){
                                            //           CommonWidgets().customDialogButton1(
                                            //               routerContext: context,
                                            //               onTap: (){
                                            //                 Get.back();
                                            //               }, mainText: confirm.msg, buttonText: '확인');
                                            //         }
                                            //       }
                                            //     } else{
                                            //       CommonWidgets().customSnackbar('이미 수락된 딜이에요');
                                            //       esC.change.value = 0;
                                            //     }
                                            //   }
                                            // }
                                          );

                                        },
                                        boxColor: Style.yellow,
                                        text: '딜 수락하기',
                                        textColor: Style.brown,
                                      ) :  _button(onTap: (){}, boxColor: Style.ultimateGrey, text: '진행 중...', textColor: Style.white, context: context)
                                    ;
                                  }
                              )
                            ],
                          )  :  SizedBox(
                            height: WidgetSize(context).height60px-WidgetSize(context).sizedBox5,
                            child: Center(child: _textU18px700w('종료된 딜이에요', context)),
                          ),
                        ),
                      ],
                    )
                ),
              )
      );
    });
  }

  //_oneText(text1: '월 할부금' , text2: '${estimate.deInstallmentMonthPrice}')
  static Widget _specialText({
    required String text1, required String text2, required BuildContext context
  }){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _textR18px700w(text1, context),  Row(
          children: [
            _textR14px700w('VAT 포함 ', context),
            _textR18px700w('월 $text2', context),
          ],
        )
      ],
    );
  }

  static Widget _oneText({
  required String text1, required String text2, required BuildContext context
}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _textB16px400w(text1, context),  _textB16px400w(text2, context)
      ],
    );
  }

  static Widget _pad1(BuildContext context){
    return SizedBox(
      height: WidgetSize(context).sizedBox10,
    );
  }

  static Widget _pad2(BuildContext context){
    return SizedBox(
      height: WidgetSize(context).sizedBox9,
    );
  }

  static Widget _area1({
    required BuildContext context,
    required String deType,
    required String deJoinTkIdx,
    required String deSupportType,
    required String deContractPlan,
    required String deInstallmentMonth,
}){

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textB18px700w('가입 유형', context),  _textB18px700w(deType, context)
          ],
        ),
        _pad1(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textB18px700w('개통 통신사', context),  _textB18px700w(deJoinTkIdx, context)
          ],
        ),
        _pad1(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textB18px700w('통신사 할인', context),  _textB18px700w(deSupportType, context)
          ],
        ),
        _pad1(context),
        deSupportType == '공시지원' ?
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textB18px700w(
                    switch(deContractPlan){
                      'SK_PREMIUM_PASS' => '프리미엄패스',
                      'SK_PREMIUM_PASS_NONE' => '프리미엄패스',
                      'KT_SIMPLE_COURSE' => '약정코스',
                      'KT_BASIC_COURSE' => '약정코스',
                      _ => '약정플랜'
                    }, context
                ),
                _textB18px700w(
                    switch(deContractPlan){
                      'SK_PREMIUM_PASS' => '가입',
                      'SK_PREMIUM_PASS_NONE' => '미가입',
                      'KT_SIMPLE_COURSE' => '심플코스',
                      'KT_BASIC_COURSE' => '베이직코스',
                      _ => '식스플랜'
                    },
                    context)
              ],
            ),
            _pad1(context),
          ],
        ) : const SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textB18px700w('할부개월', context),  _textB18px700w(deInstallmentMonth== '0' ? '현금구매' : '$deInstallmentMonth개월', context)
          ],
        ),
      ],
    );
  }

  static Widget _area2({
    required BuildContext context,
    required String deSupportType,
    required String deSupportPrice,
    required String deAddSupportPrice,
    required String deTransPrice,
    required String deAddTransPrice,
    required String deTransYN,
    required String deInstallmentMonth,
    required String dePsName,
    required String deFactoryPrice,
    required String deSale,
    required String deInstallmentPrincipal,
    required String deInstallmentInterest,
  }){

    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _textB18px700w('단말기', context),
              SizedBox(width: WidgetSize(context).sizedBox7_5,),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                            width: WidgetSize(context).sizedBox1*1.2,
                          color: Style.brown
                        )
                      )
                    ),
                      child: Column(
                        children: [
                          _textBr18px700w(dePsName, context),
                        ],
                      )),
                ),
              )
            ],
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox14,
          ),
          _blockTextNormal(title: '출고가', pay: deFactoryPrice, context: context),
          deSupportType == 'CHOICE' ? SizedBox() :
           Column(
             children: [
               _blockTextMinus(title: AppElement.pay1, pay: deSupportPrice, context: context),
               deAddSupportPrice == '0' ? const SizedBox()
               :_blockTextMinus(title: AppElement.pay2, pay: deAddSupportPrice, context: context),
               deTransYN == 'N' || deTransPrice == '8' ? const SizedBox()
                   :_blockTextMinus(title: AppElement.pay3, pay: deTransPrice, context: context),
               deAddTransPrice == '0' ? const SizedBox()
                   :_blockTextMinus(title: AppElement.pay4, pay: deAddTransPrice, context: context)
             ],
           ),
          _blockTextMinus(title: '기타할인', pay: deSale, context: context),
          deTransPrice != '0' || deTransPrice == '8' || deAddTransPrice != '0'
          ?
          SizedBox(
            height: WidgetSize(context).sizedBox14,
          ) : const SizedBox(),
          _blockTextNormal(title: deInstallmentMonth == '0' ? '현금' : '할부원금', pay: deInstallmentPrincipal, context: context),

          deInstallmentMonth == '0' ? SizedBox() :
              _blockTextNormal(title: '할부이자', pay: deInstallmentInterest, context: context)
        ],
      ),
    );
  }

  static Widget _area3({
    required BuildContext context,
    required String deSupportType,
    required String dePlan,
    required String dePlanBasic,
    required String deOptionalSale,
    required String deAgreementSale,
    required List<String> dePromotionName,
    required List<String> dePromotionSale,
    required String deWelfareSale,
    required String deOptionalMonth
  }){
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _textB18px700w('요금제', context),
              SizedBox(width: WidgetSize(context).sizedBox7_5,),
              Expanded(
                child: SingleChildScrollView(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.only(left: WidgetSize(context).sizedBox7_5),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                          border: Border(
                              bottom: BorderSide(
                                  width: WidgetSize(context).sizedBox1*1.2,
                                  color: Style.brown
                              )
                          )
                      ),
                      child: _textBr18px700w(dePlan, context)),
                ),
              )
            ],
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox14,
          ),
          _blockTextNormal(title: '월정액', pay: dePlanBasic, context: context),

          deSupportType == 'CHOICE' && deOptionalMonth != ''
              ?
          deOptionalMonth == '0' ?  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _textB16px400w('약정개월', context), _textB16px400w('무약정', context)
            ],
          )
          : _blockTextNormalMonString(title: '약정개월', pay: deOptionalMonth, context: context)
              : const SizedBox(),

            deSupportType == 'CHOICE' ?
            _blockTextMinus(title: '선택약정할인', pay: deOptionalSale, context: context) : const SizedBox(),

          deAgreementSale.contains(',') ?
          _blockTextMinus(title: '요금약정할인', pay: deAgreementSale, context: context) : const SizedBox(),

          deWelfareSale.contains(',') ?
          _blockTextMinus(title: '복지할인', pay: deWelfareSale, context: context) : SizedBox(),

          Column(
            children: [...List.generate(dePromotionName.length, (index) =>
            dePromotionName.isNotEmpty && dePromotionSale.isNotEmpty && dePromotionName[index] != '' && dePromotionSale[index] != '0'
                ?  _blockTextMinus(title: dePromotionName[index], pay: dePromotionSale[index], context: context)
                : const SizedBox(),
            )]
          )

        ],
      ),
    );
  }

  static Widget _blockTextNormal({required String title, required String pay, required BuildContext context}){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textB16px400w(title, context), _textB16px400w('$pay원', context)
          ],
        ),
        _pad2(context),
      ],
    );
  }

  static Widget _blockTextNormalMonString({required String title, required String pay, required BuildContext context}){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textB16px400w(title, context), _textB16px400w('$pay개월', context)
          ],
        ),
        _pad2(context),
      ],
    );
  }

  static Widget _blockTextNormalMon({required String title, required int pay, required BuildContext context}){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textB16px400w(title, context), _textB16px400w('$pay개월', context)
          ],
        ),
        _pad2(context),
      ],
    );
  }

  static Widget _blockTextMinus({required String title, required String pay, required BuildContext context}){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textB16px400w(title, context),
            pay.contains(',')
                ? _textR16px400w('-$pay원', context)
                : pay == '18'
                    ?  _textB16px400w('확인불가', context)
                    :  pay == '0'
                        ? _textB16px400w('$pay원', context)
                        :  _textR16px400w('-$pay원', context)
          ],
        ),
        _pad2(context),
      ],
    );
  }

  static Widget _textB18px700w(String text, BuildContext context){
    return Text(
      text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox18,
          fontWeight: FontWeight.w700,
          color: Style.blackWrite
      ),
    );
  }

  static Widget _textU18px700w(String text, BuildContext context){
    return Text(
      text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox18,
          fontWeight: FontWeight.w700,
          color: Style.ultimateGrey
      ),
    );
  }

  static Widget _textB16px400w(String text, BuildContext context){
    return Text(
      text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox16,
          fontWeight: FontWeight.w400,
          color: Style.blackWrite
      ),
    );
  }

  static Widget _textR18px700w(String text, BuildContext context){
    return Text(
      text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox18,
          fontWeight: FontWeight.w700,
          color: Style.red
      ),
    );
  }

  static Widget _textR16px400w(String text, BuildContext context){
    return Text(
      text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox16,
          fontWeight: FontWeight.w400,
          color: Style.red
      ),
    );
  }

  static Widget _textR14px700w(String text, BuildContext context){
    return Text(
      text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox14,
          fontWeight: FontWeight.w700,
          color: Style.red
      ),
    );
  }

  static Widget _textBr18px700w(String text, BuildContext context){
    return Text(text,
      style: TextStyle(
        fontSize: text.length>18 ? WidgetSize(context).sizedBox14 : WidgetSize(context).sizedBox18,
        fontWeight: FontWeight.w700,
        color: Style.brown,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.end,
    );
  }


  static Widget _button({
    required GestureTapCallback onTap,
    required Color boxColor,
    required String text,
    required Color textColor,
    required BuildContext context,
  }){
    return
      RippleDecorationButton(
          onTap: onTap,
          borderRadius: BorderRadius.circular(999),
          color: boxColor,
          height: WidgetSize(context).height60px-WidgetSize(context).sizedBox5,
          width: WidgetSize(context).sizedBox121+WidgetSize(context).sizedBox22,
          widget: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: WidgetSize(context).sizedBox18,
                  fontWeight: FontWeight.w400,
                  color: textColor
              ),
            ),
          )
      );
  }
}