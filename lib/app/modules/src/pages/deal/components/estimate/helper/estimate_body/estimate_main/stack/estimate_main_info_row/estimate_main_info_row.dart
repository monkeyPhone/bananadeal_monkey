import 'package:banana_deal_by_monkeycompany/app/components/rich_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_body/estimate_main/stack/estimate_main_info_row/estimate_main_info_row_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../models/nav/deal/deal_estimate.dart';
import 'estimate_main_row_icon.dart';

class EstimateMainInfoRow extends StatelessWidget {
  final DealEstimateList selectEstimate;
  const EstimateMainInfoRow({
    required this.selectEstimate,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  RichTextWidget(
        list: [
          ('참여',
          TextStyle(
            fontWeight: FontWeight.w700,
            color: Style.grey999999,
            fontSize: WidgetSize(context).sizedBox14,
          )
          ),
          (' ',
          TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: WidgetSize(context).sizedBox10,
          )
          ),
          ('${selectEstimate.sendDeal}/${selectEstimate.inviteDeal}건',
          TextStyle(
            fontWeight: FontWeight.w400,
            color: Style.blackWrite,
            fontSize: WidgetSize(context).sizedBox14,
          )
          ),
          (' ',
          TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: WidgetSize(context).sizedBox15,
          )
          ),
          ('수락',
          TextStyle(
            fontWeight: FontWeight.w700,
            color: Style.grey999999,
            fontSize: WidgetSize(context).sizedBox14,
          )
          ),
          (' ',
          TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: WidgetSize(context).sizedBox10,
          )
          ),
          ('${selectEstimate.openDeal}건',
          TextStyle(
            fontWeight: FontWeight.w400,
            color: Style.blackWrite,
            fontSize: WidgetSize(context).sizedBox14,
          )
          ),
          (' ',
          TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: WidgetSize(context).sizedBox15,
          )
          ),
          ('★',
          TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.yellow,
            fontSize: WidgetSize(context).sizedBox14,
          )
          ),
          (' ',
          TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: WidgetSize(context).sizedBox10,
          )
          ),
          (selectEstimate.avgPoint == ''
              ? '0.0' : selectEstimate.avgPoint,
          TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: WidgetSize(context).sizedBox14,
          )
          ),
        ]
    );



      Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        EstimateMainInfoRowText(text1: '참여', text2 : '${selectEstimate.sendDeal}/${selectEstimate.inviteDeal}건'),
        SizedBox(width: WidgetSize(context).sizedBox5,),
        EstimateMainInfoRowText(text1: '수락', text2 : '${selectEstimate.openDeal}건'),
        SizedBox(width: WidgetSize(context).sizedBox5,),
        EstimateMainRowIcon(text1: selectEstimate.avgPoint == ''
            ? '0.0' : selectEstimate.avgPoint)
      ],
    );
  }

}
