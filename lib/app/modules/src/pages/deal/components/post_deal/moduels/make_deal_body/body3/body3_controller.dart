import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../make_deal/controllers/make_deal_controller.dart';
import '../body4/body4_controller.dart';
import '../body5/body5_controller.dart';
import '../body6/body6_controller.dart';
import '../body7/body7_controller.dart';


class Body3Controller extends GetxController {
  static Body3Controller get to => Get.find();
  RxInt check = 0.obs;

  List checkText = ['', '상관없어요',  '원하는 통신사가 있어요'];

  void body3OntapIndex(int index){
    check.value = index;
    MakeDealController.to.initBody3Controller(checkText[1]);
    Body6Controller.to.initBody6();
    Body7Controller.to.initBody7();

    if(MakeDealController.to.joinerPhone.value != MakeDealController.to.check1Text[4])
    {
      if(MakeDealController.to.checkString.value != '')
      {
        Body5Controller.to.initBody5();
        Body4Controller.to.check.value = 2;
        MakeDealController.to.joinerPhoneMax.value = '';

      }
      else{
        print(MakeDealController.to.check1Text[4]);
        Body4Controller.to.initBody4();
        Body5Controller.to.initBody5();
        MakeDealController.to.argumentInit();
        MakeDealController.to.joinerPhoneMax.value = '';
      }
    }
  }


  void body3OntapIndex2({required BuildContext context, required int index}) async{
    check.value = index;
    MakeDealController.to.requestAgency.value == '' || MakeDealController.to.requestAgency.value == MakeDealController.to.check1Text[MakeDealController.to.currentStep.value] ?
    MakeDealController.to.requestAgency.value = '1' : null;
    await MakeDealController.to.modalOnTap(context);
    //ToDO: modalOnTap에 초기화 조건 들어있음
  }

}