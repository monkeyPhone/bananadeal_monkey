import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:get/get.dart';
import '../controllers/sign_view_1_controller.dart';
import '../controllers/sign_view_2_controller/sign_view_2/sign_view_2_controller.dart';




class SignBindings extends Bindings {

  final CommonWidgets _commonWidgets = CommonWidgets();
  final RegisterManager _registerManager = const RegisterManager();

  @override
  void dependencies() {
    Get.put(SignView1Controller(
      commonWidgets: _commonWidgets,
      repo5:  _registerManager.getRepo5()
    ));
    Get.put(SignView2Controller(
        commonWidgets: _commonWidgets,
        etcEtcRepository: _registerManager.getEtcEtcRepository(),
        repo5: _registerManager.getRepo5()
    ));

  }

}