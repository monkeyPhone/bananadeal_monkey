import 'package:banana_deal_by_monkeycompany/app/app_outs/bottom_sheet_detail/view/dialog/goto_detail_view.dart';
import 'package:flutter/material.dart';

class GotoDetail {
  const GotoDetail();

  void gotoRateDetailDialog({
    required BuildContext context,
    required String pIdx,
    required String baseUrl
  }) async{
    await Future.delayed(Duration.zero, (){
      if(context.mounted){
        showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                RateDetailDialogUi(pIdx: pIdx, baseUrl: baseUrl,)
        );
      }
    });
  }

}