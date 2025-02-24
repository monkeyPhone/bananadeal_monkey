import 'package:banana_deal_by_monkeycompany/app/components/rich_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_body/estimate_main/stack/estimate_main_info_row2/estimate_main_info_row2_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../models/nav/deal/deal_estimate.dart';

class EstimateMainInfoRow2 extends StatelessWidget {
  final DealEstimateList selectEstimate;
  final int currentSort;
  const EstimateMainInfoRow2({
    required this.selectEstimate,
    required this.currentSort,
    super.key});

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
        list: [
          ('월',
          selectEstimate.dStatus == 'PARTICIPATE' || selectEstimate.dStatus == 'OPEN' || selectEstimate.dStatus == 'ACCEPT'
              ? TextStyle(
              fontSize: WidgetSize(context).sizedBox14,
              fontWeight: FontWeight.w400,
              color: Style.blackWrite
          )
              : TextStyle(
              fontSize: WidgetSize(context).sizedBox14,
              fontWeight: FontWeight.w400,
              color: Style.grey999999
          )
          ),

          (' ', TextStyle(
              fontSize: WidgetSize(context).sizedBox10,
              fontWeight: FontWeight.w400,
              color: Style.grey999999
          )),


          ('${NumberFormat('###,###').format(selectEstimate.deMonthTotalPrice)}원',
          selectEstimate.dStatus == 'PARTICIPATE' || selectEstimate.dStatus == 'OPEN' || selectEstimate.dStatus == 'ACCEPT'
              ?  currentSort == 0
              ?  TextStyle(
              fontSize: WidgetSize(context).sizedBox18,
              fontWeight: FontWeight.w700,
              color: Style.red
          )
              :  TextStyle(
              fontSize: WidgetSize(context).sizedBox18,
              fontWeight: FontWeight.w700,
              color: Style.blackWrite
          )
              :  TextStyle(
              fontSize: WidgetSize(context).sizedBox18,
              fontWeight: FontWeight.w700,
              color: Style.grey999999
          ),
          ),
          (' ', TextStyle(
              fontSize: WidgetSize(context).sizedBox10,
              fontWeight: FontWeight.w400,
              color: Style.grey999999
          )),
          ('/',
          selectEstimate.dStatus == 'PARTICIPATE' || selectEstimate.dStatus == 'OPEN' || selectEstimate.dStatus == 'ACCEPT'
              ? TextStyle(
              fontSize: WidgetSize(context).sizedBox14,
              fontWeight: FontWeight.w400,
              color: Style.blackWrite
          )
              : TextStyle(
              fontSize: WidgetSize(context).sizedBox14,
              fontWeight: FontWeight.w400,
              color: Style.grey999999
          ),
          ),
          (' ', TextStyle(
              fontSize: WidgetSize(context).sizedBox10,
              fontWeight: FontWeight.w400,
              color: Style.grey999999
          )),
          (selectEstimate.deInstallmentMonth == 0 ? '현금' : '할부원금',
          selectEstimate.dStatus == 'PARTICIPATE' || selectEstimate.dStatus == 'OPEN' || selectEstimate.dStatus == 'ACCEPT'
              ? TextStyle(
              fontSize: WidgetSize(context).sizedBox14,
              fontWeight: FontWeight.w400,
              color: Style.blackWrite
          )
              : TextStyle(
              fontSize: WidgetSize(context).sizedBox14,
              fontWeight: FontWeight.w400,
              color: Style.grey999999
          )
          ),

          (' ', TextStyle(
              fontSize: WidgetSize(context).sizedBox10,
              fontWeight: FontWeight.w400,
              color: Style.grey999999
          )),

          (selectEstimate.deInstallmentMonth == 0
              ? selectEstimate.deCash <= 0
              ? '0'
              : '${NumberFormat('###,###').format(selectEstimate.deCash)}원'
              : '${NumberFormat('###,###').format(selectEstimate.deInstallmentPrincipal)}원',
          selectEstimate.dStatus == 'PARTICIPATE' || selectEstimate.dStatus == 'OPEN' || selectEstimate.dStatus == 'ACCEPT'
              ? currentSort == 1
              ? TextStyle(
              fontSize: WidgetSize(context).sizedBox18,
              fontWeight: FontWeight.w700,
              color: Style.red
          )
              : TextStyle(
              fontSize: WidgetSize(context).sizedBox18,
              fontWeight: FontWeight.w700,
              color: Style.blackWrite
          )
              : TextStyle(
              fontSize: WidgetSize(context).sizedBox18,
              fontWeight: FontWeight.w700,
              color: Style.grey999999
          )
          ),
        ]
    );
  }
}
