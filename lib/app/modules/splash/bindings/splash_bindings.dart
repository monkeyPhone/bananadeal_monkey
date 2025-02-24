import 'package:banana_deal_by_monkeycompany/app/components/common_dialog/common_widgets_2.dart';
import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/permission/controllers/permission_page_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/permission/permission_handler_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/app_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';



class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(
        appRepository: const RegisterManager().getAppRepository(),
        pm: PermissionHandlerManager(),
        apiConsole: ApiConsole(),
        commonWidgets: CommonWidgets()
    ));
    Get.put(PermissionPageController(
      commonWidgets2: CommonWidgets2()
    ));
  }

}