import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:get/get.dart';
import '../moduels/make_deal/controllers/make_deal_controller.dart';
import '../moduels/make_deal_body/body1/body1_controller.dart';
import '../moduels/make_deal_body/body2/body2_controller.dart';
import '../moduels/make_deal_body/body3/body3_controller.dart';
import '../moduels/make_deal_body/body4/body4_controller.dart';
import '../moduels/make_deal_body/body5/body5_controller.dart';
import '../moduels/make_deal_body/body6/body6_controller.dart';
import '../moduels/make_deal_body/body7/body7_controller.dart';



class MakeDealBindings extends Bindings {

  final CommonWidgets _commonWidgets = CommonWidgets();
  final RegisterManager _registerManager = const RegisterManager();

  @override
  void dependencies() {
    Get.put(MakeDealController(
        bdBotNavRepository: _registerManager.getBdBotNavRepository(),
        makeDealRepository: _registerManager.getMakeDealRepository(),
        ratePlanRepository: _registerManager.getRatePlanRepository(),
        commonWidgets: _commonWidgets,
        phoneSpecRepository: _registerManager.getPhoneSpecRepository()
    ));
    Get.put(Body1Controller());
    Get.put(Body2Controller());
    Get.put(Body3Controller());
    Get.put(Body4Controller());
    Get.put(Body5Controller());
    Get.put(Body6Controller());
    Get.put(Body7Controller());

  }

}