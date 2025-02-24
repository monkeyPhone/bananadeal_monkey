import 'package:banana_deal_by_monkeycompany/app/modules/main/banner_button/banner_button_controller.dart';
import 'package:get/get.dart';

class BannerButtonBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BannerButtonController());
  }

}