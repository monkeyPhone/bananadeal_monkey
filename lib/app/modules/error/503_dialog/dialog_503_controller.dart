import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:get/get.dart';
import '../../../models/version_check.dart';
import '../../main/auth/auth_controller.dart';



class Dialog503Controller extends GetxController {
  RxBool internetStatus = false.obs;
  RxString errorValue = ''.obs;

  @override
  void onInit() async{
    super.onInit();
    ever(internetStatus, (bool value) async{
      if (value) {
        AuthController.to.deleteServer();
        Get.back();
        Get.delete<Dialog503Controller>();
        errorValue.value == 'splash' ? AuthController.to.statusCheck() : null;
        errorValue.value == 'src' ? await AuthController.to.logout('Dialog503Controller') : null;
      }
    });
    await checkServerStatus();
  }

  Future<void> checkServerStatus() async {
    while (!internetStatus.value) {
      final VersionCheck logic =  await ApiConsole().serverChecker();
      internetStatus.value = logic.status == 200;
      await Future.delayed(Duration(seconds: 1));
    }
  }
}