import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BannerButtonController extends GetxController {

  Future<void> waitForControllerClosed() async {
    await Future.delayed(Duration(milliseconds: 1200));
    try{
      if (SrcInfoController.to.initialized) {
        await Future.delayed(Duration(milliseconds: 500));
        await waitForControllerClosed(); // 재귀 호출
      }
      else{
        await Future.delayed(Duration(milliseconds: 500));
        Get.offAllNamed(Routes.SRC);
      }
    } catch(e){
      await Future.delayed(Duration(milliseconds: 500));
      Get.offAllNamed(Routes.SRC);
    }
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await waitForControllerClosed();

  }

}