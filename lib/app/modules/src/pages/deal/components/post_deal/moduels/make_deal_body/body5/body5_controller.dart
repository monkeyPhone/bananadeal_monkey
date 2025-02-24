import 'package:get/get.dart';

import '../../make_deal/controllers/make_deal_controller.dart';

class Body5Controller extends GetxController {
  static Body5Controller get to => Get.find();

  RxInt check = 0.obs;

  void initBody5(){
    Body5Controller.to.check.value = 0;
    MakeDealController.to.joinerPhoneRec.value = '';
  }

  void body5OnTap(int index){
    check.value = index;
    MakeDealController.to.joinerPhoneRec.value = MakeDealController.to.joinerPhoneRecList[index];
  }

}