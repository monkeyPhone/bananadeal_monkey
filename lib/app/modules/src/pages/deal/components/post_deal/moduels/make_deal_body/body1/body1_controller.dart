import 'package:get/get.dart';

import '../../make_deal/controllers/make_deal_controller.dart';
import '../body5/body5_controller.dart';

class Body1Controller extends GetxController {

  RxInt check = 0.obs;
  List stepYearList1 =
  [
    '', '성인', '어르신', '청소년', '어린이', '현역군인'
  ];
  List stepYearList2 =
  [
    '', '(만 19세 이상)', '(만 65세 이상)', '(만 18세 이하)', '(만 12세 이하)', '(의무복무 중인 현역 병사)'
  ];

  void checkTap(int index){
    check.value = index;
    MakeDealController.to.joinerAge.value = stepYearList1[index];
    MakeDealController.to.joinerPhoneRecList.value = MakeDealController.to.selectAge();
    Body5Controller.to.initBody5();
  }

}