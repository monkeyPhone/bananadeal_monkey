import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_rateplan/search_rateplan_status/dialog/rate_dialog_get.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../models/deal/phone_rate_plan.dart';



class RateDialog {
  void clickDetailDialog({required BuildContext routerContext, required RateList rate}){
    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: routerContext,
          barrierDismissible: true,
          builder: (BuildContext context) =>
              RateDialogGet(rate: rate,)
      );
    });

  }
}