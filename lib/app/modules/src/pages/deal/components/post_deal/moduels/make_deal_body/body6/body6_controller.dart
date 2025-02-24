
import 'package:get/get.dart';

import '../../make_deal/controllers/make_deal_controller.dart';
import '../body7/body7_controller.dart';

class Body6Controller extends GetxController {
  static Body6Controller get to => Get.find();

  RxInt check = 0.obs;

  List checkText = ['', '요금제를 추천해주세요', '요금제를 직접 선택할래요'];

  void initBody6(){
    check.value = 0;
    MakeDealController.to.joinerRateplan.value = '';
    MakeDealController.to.joinerRateplanIdx.value = '';
  }

  void body6OntapIndex2(int index){
    check.value = index;
    MakeDealController.to.joinerRateplan.value == ''  ||  MakeDealController.to.joinerRateplan.value == checkText[1]
        ? MakeDealController.to.joinerRateplan.value = '1'
        : null;
    Body7Controller.to.initBody7();
    MakeDealController.to.searchRate();
  }

  void body6OntapIndex(int index){
    check.value = index;
    MakeDealController.to.joinerRateplan.value = checkText[1];
    if( MakeDealController.to.joinerRateplan.value != checkText[1])
    {
      Body7Controller.to.initBody7();
      MakeDealController.to.joinerRateplanIdx.value = '';

    }
  }

}