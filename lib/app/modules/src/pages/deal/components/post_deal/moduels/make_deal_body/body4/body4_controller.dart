import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal_body/body6/body6_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal_body/body7/body7_controller.dart';
import 'package:get/get.dart';
import '../../make_deal/controllers/make_deal_controller.dart';
import '../body5/body5_controller.dart';


class Body4Controller extends GetxController {
  static Body4Controller get to => Get.find();

  RxInt check = 0.obs;

  List checkText = ['', '단말기를 추천해주세요',  '단말기를 직접 선택할래요'];
  String checkTextEtc = '(효도폰, 학생폰 등)';

  void initBody4(){
    check.value = 0;
    MakeDealController.to.joinerPhone.value = '';
  }

  void body4OntapIndex2(int index){
    MakeDealController.to.joinerPhone.value == '' || MakeDealController.to.joinerPhone.value == checkText[1]
        ? MakeDealController.to.joinerPhone.value = '1'
        : null;
    check.value = index;
    Body5Controller.to.initBody5();
    Body6Controller.to.initBody6();
    Body7Controller.to.initBody7();
    MakeDealController.to.searchPhone();
    MakeDealController.to.initPromotion();
  }

  void body4OntapIndex(int index){
    check.value = index;
    MakeDealController.to.initPromotion();
    MakeDealController.to.argumentInit();
    Body6Controller.to.initBody6();
    Body7Controller.to.initBody7();
    MakeDealController.to.joinerPhoneMax.value = '';
    MakeDealController.to.joinerPhone.value = checkText[1];
    if( MakeDealController.to.joinerPhone.value != checkText[1])
    {

      Body5Controller.to.initBody5();

    }
  }

}