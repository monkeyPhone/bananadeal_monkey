import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../make_deal/controllers/make_deal_controller.dart';

class Body2Controller extends GetxController {

  RxInt check = 0.obs;

  List checkText = ['', '없어요',  '현재 이용하고 있는 통신사가 있어요'];

  void onTapIndex(int index){
    check.value = index;
    MakeDealController.to.initBody2Controller(checkText[index]);
  }

  void onTapIndex2({required BuildContext context, required int index}) async{
    check.value = index;
    MakeDealController.to.currentAgency.value == '' || MakeDealController.to.currentAgency.value == MakeDealController.to.check1Text[MakeDealController.to.currentStep.value]
        ? MakeDealController.to.currentAgency.value = '1'
        : null;
    await MakeDealController.to.modalOnTap(context);
  }

}