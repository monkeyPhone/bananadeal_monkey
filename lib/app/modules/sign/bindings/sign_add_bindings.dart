import 'package:banana_deal_by_monkeycompany/app/components/common_dialog/common_widgets_2.dart';
import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/permission/permission_handler_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/app_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/sign/sign_5_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:get/get.dart';
import '../controllers/sign_view_3_controller.dart';
import '../controllers/sign_view_4_controller.dart';
import '../controllers/sign_view_5_controller.dart';



class SignAddBindings extends Bindings {


  final CommonWidgets _commonWidgets = CommonWidgets();
  
  final PermissionHandlerManager _permissionHandlerManager = PermissionHandlerManager();
  
  @override
  void dependencies() {
    Get.put(SignView3Controller(
    commonWidgets: _commonWidgets, commonWidgets2: CommonWidgets2(), permissionHandlerManager: _permissionHandlerManager,
    ));
    Get.put(SignView4Controller(
        commonWidgets: _commonWidgets, 
        permissionHandlerManager: _permissionHandlerManager
      
    ));
    Get.put(SignView5Controller(commonWidgets: _commonWidgets));
  }

}