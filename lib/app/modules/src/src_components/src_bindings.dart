import 'package:banana_deal_by_monkeycompany/app/components/common_dialog/common_widgets_2.dart';
import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/image/image_dialog_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/permission/permission_handler_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_estimate_controller.dart';
import 'package:get/get.dart';
import '../pages/chat/controllers/chat_controller.dart';
import '../pages/deal/controllers/deal_controller.dart';
import '../pages/etc/controllers/etc_controller.dart';
import '../pages/store/controllers/store_controller.dart';
import '../pages/widgets/service/chat_service_controller.dart';
import 'bottom_nav_bar/controllers/bd_bot_nav_chat_controller.dart';
import 'bottom_nav_bar/controllers/bd_bot_nav_controller.dart';
import 'bottom_nav_bar/controllers/bd_bot_nav_store_controller.dart';
import 'controllers/src_banner_controller.dart';
import 'controllers/src_deal_controller.dart';
import 'controllers/src_info_controller.dart';
import 'controllers/src_noti_controller.dart';
import 'controllers/src_rank_controller.dart';
import 'controllers/src_route_controller.dart';

class SrcBindings extends Bindings {

  final PermissionHandlerManager _permissionHandlerManager = PermissionHandlerManager();
  final RegisterManager _registerManager = const RegisterManager();
  final CommonWidgets _commonWidgets = CommonWidgets();
  final CommonWidgets2 _commonWidgets2 = CommonWidgets2();
  final ImageDialogManager _imageDialogManager = ImageDialogManager();
  
  @override
  void dependencies() {
    Get.put(
      SrcEstimateController(srcEstimateRepository: _registerManager.getSrcEstimateRepository())
    );
    Get.put(SrcInfoController(
        srcInfoRepository: _registerManager.getSrcInfoRepository(),
        etcEtcRepository: _registerManager.getEtcEtcRepository(),
        commonWidgets: _commonWidgets, commonWidgets2: _commonWidgets2, permissionHandlerManager: _permissionHandlerManager
    ));
    Get.put(SrcDealController(
        commonWidgets: _commonWidgets,
        srcDealRepository: _registerManager.getSrcDealRepository(), bdBotNavRepository: _registerManager.getBdBotNavRepository(),
        makeDealRepository: _registerManager.getMakeDealRepository()
    ));
    Get.put(SrcBannerController(
        etcEventRepository: _registerManager.getEtcEventRepository(),
        etcEtcRepository: _registerManager.getEtcEtcRepository(),
        srcBannerRepository: _registerManager.getSrcBannerRepository(), commonWidgets: _commonWidgets, imageDialogManager: _imageDialogManager
    ));
    Get.put(SrcRouteController(
        ratePlanRepository: _registerManager.getRatePlanRepository(),
        permissionHandlerManager: _permissionHandlerManager, commonWidgets: _commonWidgets, commonWidgets2: _commonWidgets2,
        chatServiceRepository: _registerManager.getChatServiceRepository(),
        bookmarkRepository: _registerManager.getBookmarkRepository(),
        bdBotNavRepository: _registerManager.getBdBotNavRepository(),
        storeRepository: _registerManager.getStoreRepository(),
        changeMapRepository: _registerManager.getChangeMapRepository()
    ));
    Get.put(SrcRankController(
        commonWidgets: _commonWidgets,
        srcRankRepository: _registerManager.getSrcRankRepository()));
    Get.put(BdBotNavController(commonWidgets: _commonWidgets));
    Get.put(BdBotNavStoreController(storeRepository: _registerManager.getStoreRepository(), bdBotNavRepository: _registerManager.getBdBotNavRepository()
    ));
    Get.put(BdBotNavChatController(
      chatServiceRepository: _registerManager.getChatServiceRepository()
    ));
    Get.put(StoreController(storeRepository: _registerManager.getStoreRepository(), bdBotNavRepository: _registerManager.getBdBotNavRepository()
    ));
    Get.put(DealController(srcDealRepository: _registerManager.getSrcDealRepository(), srcEstimateRepository: _registerManager.getSrcEstimateRepository(),
      commonWidgets: _commonWidgets, dealRepository: _registerManager.getDealRepository()
    ));
    Get.put(ChatController(
        imageDialogManager: _imageDialogManager,
        chatServiceRepository: _registerManager.getChatServiceRepository(), commonWidgets: _commonWidgets));
    Get.put(EtcController(
        imageDialogManager: _imageDialogManager,
        etcInfoRepository: _registerManager.getEtcInfoRepository(),
        etcEventRepository: _registerManager.getEtcEventRepository(),
        bookmarkRepository: _registerManager.getBookmarkRepository(),
        storeRepository: _registerManager.getStoreRepository(),
        repo5: _registerManager.getRepo5(),
        srcInfoRepository: _registerManager.getSrcInfoRepository(),
        commonWidgets: _commonWidgets,
        commonWidgets2: _commonWidgets2,
        etcEtcRepository: _registerManager.getEtcEtcRepository()
    ));
    Get.put(ChatServiceController(
      chatServiceRepository: _registerManager.getChatServiceRepository(), commonWidgets: _commonWidgets
    ));
    Get.put(SrcNotiController(
      commonWidgets: _commonWidgets
    ));
  }
}



