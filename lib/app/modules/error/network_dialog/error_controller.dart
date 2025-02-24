import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:get/get.dart';
import '../../main/auth/auth_controller.dart';

class ErrorController extends GetxController {
  RxBool internetStatus = false.obs;
  RxBool failClose = false.obs;
  RxString errorValue = ''.obs;

  @override
  void onInit() async{
    super.onInit();
    ever(internetStatus, (bool value) {
      if (value) {
        AuthController.to.deleteServer();
        if(Get.isSnackbarOpen){
          Get.back();
          Get.back();
        } else{
          Get.back();
        }
        Get.delete<ErrorController>();
        errorValue.value == 'splash' ? AuthController.to.statusCheck() : null;
        errorValue.value == 'storeDetail' ? Get.back() : null;

        Timer(Duration(seconds: 2), (){
          failClose.value = true;
        });
      }
    });
    await checkInternetStatus();
  }

  Future<void> checkInternetStatus() async {
    while (!internetStatus.value) {
      internetStatus.value = await ApiConsole().getInternetStatus();
      await Future.delayed(Duration(seconds: 1));
    }
  }
}