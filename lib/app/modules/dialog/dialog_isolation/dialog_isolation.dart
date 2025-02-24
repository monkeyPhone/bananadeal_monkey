import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/widgets/aleart.dart';
import 'package:flutter/material.dart';

class DialogIsolation{
  void openAddressDialog({required BuildContext routerContext, required middleText1,
    required middleText2,
    required middleText3,
    required onTapCancle,
    required onTapConfirm,
  }) {
    Future.delayed(Duration.zero, (){
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            builder: (BuildContext context) =>
                AlertMessage(
                  middleText1: middleText1,
                  middleText2: middleText2,
                  middleText3: middleText3,
                  cancleText: '취소', confirmText: '선택',
                  onTapCancle: onTapCancle,
                  onTapConfirm: onTapConfirm,
                )
        );
      }
    });
  }
}