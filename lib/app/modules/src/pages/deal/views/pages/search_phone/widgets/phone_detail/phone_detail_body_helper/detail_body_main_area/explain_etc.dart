import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/etc_helper/explain_menu_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';

class ExplainRowEtc extends StatelessWidget {
  final String nfc;
  final String usim;
  final String type;
  final String film;
  final String aod;
  final String pay;
  final String ip;
  final String component;
  const ExplainRowEtc({
    required this.nfc,
    required this.usim,
    required this.type,
    required this.film,
    required this.aod,
    required this.pay,
    required this.ip,
    required this.component,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Style.white,
            border: Border(
              bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyCCCCCC)
            )
          ),
          padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              flex: 4,
                              fit: FlexFit.tight,
                              child: ExplainMenuText(text: 'NFC',),
                          ),
                          Flexible(
                              flex: 6,
                              fit: FlexFit.tight,
                              child: ExplainSubText(text: nfc,),
                          ),
                        ],
                      )
                  ),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox()),
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: ExplainMenuText(text: 'USIM',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: ExplainSubText(text: usim,),
                          ),
                        ],
                      )
                  ),
                ],
              ),
              SizedBox(height: WidgetSize(context).sizedBox20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: ExplainMenuText(text: '충전타입',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: ExplainSubText(text: type,),
                          ),
                        ],
                      )
                  ),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox()),
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: ExplainMenuText(text: '필름부착',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: ExplainSubText(text: film,),
                          ),
                        ],
                      )
                  ),
                ],
              ),
              SizedBox(height: WidgetSize(context).sizedBox20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: ExplainMenuText(text: 'AOD',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: ExplainSubText(text: aod,),
                          ),
                        ],
                      )
                  ),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox()),
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: ExplainMenuText(text: '페이기능',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: ExplainSubText(text: pay,),
                          ),
                        ],
                      )
                  ),
                ],
              ),
              SizedBox(height: WidgetSize(context).sizedBox20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: ExplainMenuText(text: '방진방수',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: ExplainSubText(text: ip,),
                          ),
                        ],
                      )
                  ),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox()),
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: ExplainMenuText(text: '',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: ExplainSubText(text: '',),
                          ),
                        ],
                      )
                  ),
                ],
              ),
              SizedBox(height: WidgetSize(context).sizedBox10,),
            ],
          ),
        ),
        SizedBox(height: WidgetSize(context).sizedBox20,),
        Text('구성품',
          style: TextStyle(
              color: Style.specPink,
              fontSize: WidgetSize(context).sizedBox22,
              fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(height: WidgetSize(context).sizedBox10,),
        Container(
          padding: EdgeInsets.all(WidgetSize(context).sizedBox12),
          width: WidgetSize(context).widthCommon,
          decoration: BoxDecoration(
            color: Style.white,
            border: Border.all(width: WidgetSize(context).sizedBox1, color: Style.greyCCCCCC)
          ),
          child: ExplainSubText(text: component,),
        ),
        SizedBox(height: WidgetSize(context).sizedBox10,)
      ],
    );
  }

}