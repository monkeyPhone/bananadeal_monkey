import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:get/get.dart';

import 'controllers/chat_log_controller.dart';
import 'controllers/chat_widget_controller.dart';

class ChatingBindings extends Bindings {

  final RegisterManager _registerManager = const RegisterManager();
  final CommonWidgets _commonWidgets = CommonWidgets();

  @override
  void dependencies() {
    Get.put(ChatLogController(
        chatServiceRepository: _registerManager.getChatServiceRepository(),
        makeDealRepository: _registerManager.getMakeDealRepository(),
        srcDealRepository: _registerManager.getSrcDealRepository(),
        commonWidgets: _commonWidgets
    ));
    Get.put(ChatWidgetController(
      bookmarkRepository: _registerManager.getBookmarkRepository(),
      commonWidgets: _commonWidgets,
    ));
  }

}