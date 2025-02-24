import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class StepLast extends StatelessWidget {
  final String routeCase;
  final String joinCategory;
  final String agencyCategory;
  final String joinerAge;
  final String joinerPhone;
  final String joinerPhoneRec;
  final String joinerRateplan;
  final String joinerRateRec;
  final String maxInstallment;
  final String stepModal2TextSale;
  final String stepModal3Text;
  final String stepModal4Text;
  final TextEditingController cont;
  const StepLast({
    required this.routeCase,
    required this.joinCategory,
    required this.agencyCategory,
    required this.joinerAge,
    required this.joinerPhone,
    required this.joinerPhoneRec,
    required this.joinerRateplan,
    required this.joinerRateRec,
    required this.maxInstallment,
    required this.stepModal2TextSale,
    required this.stepModal3Text,
    required this.stepModal4Text,
    required this.cont,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: WidgetSize(context).sizedBox220,
        maxHeight: double.infinity,
        minWidth: WidgetSize(context).widthCommon,
      ),
      child: SingleChildScrollView(
        child: routeCase == '상관없어요' 
                ? _routeCase1(context)
                : _routeCase2(context),
      )
    );
  }

  Widget _routeCase1(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        rowText('가입유형', joinCategory, context),
        pad(context),
        rowText('통신사', agencyCategory, context),
        pad(context),
        rowText('가입연령', joinerAge, context),
        pad(context),
        rowText('단말기', joinerPhone, context),
        pad(context),
        joinerPhoneRec == 'x'
            ? SizedBox()
            : rowText('추천 단말기 유형', joinerPhoneRec, context),
        joinerPhoneRec == 'x'
            ? SizedBox()
            :  pad(context),
        rowText('요금제',joinerRateplan, context),
        pad(context),
        joinerRateRec == 'x'
            ? SizedBox()
            : rowText('추천 요금제 유형', joinerRateRec, context),
        joinerRateRec == 'x'
            ? SizedBox()
            : pad(context),
        rowText2(
            '할부개월',
            maxInstallment == ''
                ? AppElement.promotion1
                : maxInstallment
        , context),
        pad(context),
        rowText2(
            '통신사 할인',
            stepModal2TextSale == ''
                ? AppElement.promotion1
                : stepModal2TextSale
        ,context ),
        textArea(context)
      ],
    );
  }

  Widget _routeCase2(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        rowText('가입유형', joinCategory, context),
        pad(context),
        rowText('통신사', agencyCategory, context),
        pad(context),
        rowText('가입연령', joinerAge, context),
        pad(context),
        rowText('단말기', joinerPhone, context),
        pad(context),
        joinerPhoneRec == 'x' 
            ? SizedBox() 
            : rowText('추천 단말기 유형', joinerPhoneRec, context),
        joinerPhoneRec == 'x' 
            ? SizedBox() 
            : pad(context),
        rowText('요금제',joinerRateplan, context),
        pad(context),
        joinerRateRec == 'x' 
            ? SizedBox() 
            : rowText('추천 요금제 유형', joinerRateRec, context),
        joinerRateRec == 'x' 
            ? SizedBox() 
            : pad(context),
        rowText2(
            '할부개월',
            maxInstallment == '' 
                ? AppElement.promotion1
                : maxInstallment
            , context
        ),
        pad(context),
        rowText2(
            '통신사 할인',
            stepModal2TextSale == '' 
                ? AppElement.promotion1
                : stepModal2TextSale
            , context
        ),
        pad(context),
        rowText2(
            '결합', stepModal3Text == '' 
            ? AppElement.promotion2
            : stepModal3Text
            , context
        ),
        pad(context),
        rowText2(
            '복지', stepModal4Text == '' 
            ? AppElement.promotion2
            : stepModal4Text
            , context
        ),
        textArea(context)
      ],
    );
  }

  Widget textArea(BuildContext context) {
    return Container(
      color: Style.white,
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).widthChatCili,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pad(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '기타 요청사항',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Style.blackWrite,
                    fontSize: WidgetSize(context).sizedBox18),
              ),
            ],
          ),
          pad(context),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(WidgetSize(context).sizedBox1),
              child: TextField(
                controller: cont,
                enabled: false,
                style: TextStyle(
                    fontSize: WidgetSize(context).sizedBox18, color: Style.blackWrite),
                keyboardType:
                TextInputType.multiline, //TextInputType.multiline,
                maxLines: 8,
                maxLength: 1000,
                cursorColor: Style.ultimateGrey,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(WidgetSize(context).sizedBox16),
                    counterText: '',
                    hintStyle: TextStyle(
                        fontSize: WidgetSize(context).sizedBox18,
                        color: Style.grey999999),
                  hintText: '입력값이 없습니다.',
                    filled: true,
                    fillColor: Style.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
                        borderSide: BorderSide(
                            width: WidgetSize(context).sizedBox1,
                            color: Style.greyD7D7D7)),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowText(String text1, String text2, BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            flex: 4,
            child: constText(text1, context)),
        SizedBox(
          width: WidgetSize(context).sizedBox32,
        ),
        Flexible(
            flex: 7,
            child: reactText(text2, context)),
      ],
    );
  }

  Widget rowText2(String text1, String text2, BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        constText(text1, context),
        reactText2(text2, context),
      ],
    );
  }

  Widget pad(BuildContext context){
    return SizedBox(
      height: WidgetSize(context).sizedBox14,
    );
  }

  Widget constText(String text1, BuildContext context){
    return Text(
      text1,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: WidgetSize(context).sizedBox17,
        fontWeight: FontWeight.w700
      ),
    );
  }

  Widget reactText(String text2, BuildContext context){
    return Text(
      text2,
      textAlign: TextAlign.right,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox17,
          fontWeight: FontWeight.w400
      ),
      maxLines: 2,
    );
  }

  Widget reactText2(String text2, BuildContext context){
    return Text(
      text2,
      textAlign: TextAlign.right,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox17,
          fontWeight: FontWeight.w400,
        color: text2 == AppElement.promotion1 || text2 == AppElement.promotion2  ? Style.grey999999 : Colors.black
      ),
    );
  }

}
