import 'package:get/get.dart';
import '../../make_deal/controllers/make_deal_controller.dart';

class Body7Controller extends GetxController {
  static Body7Controller get to => Get.find();

  RxInt check = 0.obs;


  void initBody7(){
    check.value = 0;
    MakeDealController.to.joinerRateRec.value = '';
  }

  void body7Ontap(int index){
    check.value = index;
    MakeDealController.to.joinerRateRec.value = MakeDealController.to.joinerRateRecList[index];
  }

}