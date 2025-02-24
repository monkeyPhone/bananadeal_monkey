import 'package:get/get.dart';
import '../modules/main/auth/auth_controller.dart';
import '../modules/main/loading/loading_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(LoadingController(), permanent: true);
  }

}


class DevBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoadingController(), permanent: true);
  }

}