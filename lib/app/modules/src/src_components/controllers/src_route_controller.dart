import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/managers/device_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/controller/reservation_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/view/reservation_view.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/upload/upload_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/bdbot/bd_bot_nav_rapository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/change_map/change_map_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/chat/chat_service_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/etc/bookmark_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/store/store_repository.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:get/get.dart';
import '../../../../components/common_dialog/common_widgets_2.dart';
import '../../../../components/common_widgets.dart';
import '../../../../managers/permission/permission_handler_manager.dart';
import '../../../../models/deal/get_guyhap.dart';
import '../../../../models/nav/deal/deal_estimate.dart';
import '../../../../routes/app_pages.dart';
import '../../../../repository/deal/rate_plan_repository.dart';
import '../../pages/store/pages/store_detail/views/store_view_details.dart';
import '../../pages/widgets/change_map/change_map_controller.dart';
import '../../pages/widgets/change_map/change_map_view.dart';
import '../../pages/widgets/upload/upload.dart';


class SrcRouteController extends GetxController{
  static SrcRouteController get to => Get.find();

  final RatePlanRepository _ratePlanRepository;
  final PermissionHandlerManager _permissionHandlerManager;
  final CommonWidgets _commonWidgets;
  final CommonWidgets2 _commonWidgets2;
  final ChatServiceRepository _chatServiceRepository;
  final BookmarkRepository _bookmarkRepository;
  final BdBotNavRepository _bdBotNavRepository;
  final StoreRepository _storeRepository;
  final ChangeMapRepository _changeMapRepository;

  SrcRouteController({
    required RatePlanRepository ratePlanRepository,
    required PermissionHandlerManager permissionHandlerManager,
    required CommonWidgets commonWidgets,
    required CommonWidgets2 commonWidgets2,
    required ChatServiceRepository chatServiceRepository,
    required BookmarkRepository bookmarkRepository,
    required BdBotNavRepository bdBotNavRepository,
    required StoreRepository storeRepository,
    required ChangeMapRepository changeMapRepository

  }) :  _ratePlanRepository = ratePlanRepository,
        _permissionHandlerManager = permissionHandlerManager,
        _commonWidgets = commonWidgets,
        _commonWidgets2 = commonWidgets2,
        _chatServiceRepository = chatServiceRepository,
        _bookmarkRepository = bookmarkRepository,
        _bdBotNavRepository = bdBotNavRepository,
        _storeRepository = storeRepository,
        _changeMapRepository = changeMapRepository;


  void gotoStoreDetail({
    bool? isInvite,
    required String smid,
    required int midx,
    required int? index1,
    required int? rong
  }) async{
    await DeviceManager.overLayClients();
    Get.until((route) => route.settings.name != '/6');
    Get.to(
            ()=>StoreViewDetails(
              isInvite: isInvite ?? false,
              smid: smid, midx: midx, indexs1: index1, rong: rong,
        ),
        binding: BindingsBuilder.put(()=>
            StoreDetailController(
                bookmarkRepository: _bookmarkRepository,
                bdBotNavRepository: _bdBotNavRepository,
                storeRepository: _storeRepository,
                commonWidgets: _commonWidgets
            ))
    );
  }

  void gotoUpload(String router) async{
    if(GetPlatform.isIOS){
      final photos = await _permissionHandlerManager.checkPermission(PermissionHandlerManager.photos);
      if(photos == PermissionHandlerManager.granted || photos == PermissionHandlerManager.limited){
        await DeviceManager.overLayClients();
        Get.to(
                ()=>Upload(
              router: router,
            ),
            binding: BindingsBuilder(() {
              Get.put(UploadController(
                commonWidgets: _commonWidgets,
                chatServiceRepository: _chatServiceRepository
              ));
            })
        );
      } else {
        _commonWidgets2.customDialogPermission(routerContext: Get.context!, route: 1);
      }
    }
    else {
      await DeviceManager.overLayClients();
      Get.to(
              ()=>Upload(
            router: router,
          ),
          binding: BindingsBuilder(() {
            Get.put(UploadController(
                commonWidgets: _commonWidgets,
                chatServiceRepository: _chatServiceRepository
            ));
          })
      );
    }
  }



  void gotoMap() async{
    await DeviceManager.overLayClients();
    Get.to(
            () => const ChangeMapView(), binding: BindingsBuilder(() {
      Get.put(ChangeMapController(
          changeMapRepository: _changeMapRepository,
          commonWidgets: _commonWidgets
      ));

    }));
  }

  void initSetting(BuildContext context){
    SrcInfoController.to.infoM.value.mIsUsed == '이용중'
        ?
      _commonWidgets.customDialog(
        routerContext: context,
        barrierDismissible: false, mainText: '서비스를 이용하기 위해서는 위치 설정을 해주세요!', cancleText: '닫기', confirmText: '설정하기', conFirmOnTap: (){
      if(Get.isSnackbarOpen){
        Get.back();
      } else{
        Get.back();
        gotoMap();
      }
    })
        :
    null;
  }

  Future<void> getDeal(String invite) async{
    GuyhapData data = await _ratePlanRepository.getGuyhapList(1);
    if(data.result == '')
    {
      _commonWidgets.customSnackbar('서버 문제로 딜을 생성할 수 없어요.');
    }
    else{
      Get.toNamed(Routes.MAKEDEAL,
          arguments:{
            'phoneName' : '',
            'phoneIdx' : '',
            'phoneModel' : '',
            'phoneImg' : '',
            'invite' : invite
          }
      );
    }
  }

  Future<void> makeDeal({
    required BuildContext context,
    required String invite
  }) async{
    SrcInfoController.to. infoM.value.mLongitude == '' || SrcInfoController.to. infoM.value.mLatitude == ''
        ?
    initSetting(context)
        :
    SrcDealController.to.currentDealList.isEmpty
        ? await getDeal(invite)
        : _commonWidgets.customSnackbar('이미 생성한 딜이 있어요. 매장목록에서 원하는 매장에게 초대장을 보내보세요!');
  }

  Future<void> getRankDeal({required String phoneName, required int phoneIdx, required String phoneModel, required String phoneImg}) async{
    GuyhapData data = await _ratePlanRepository.getGuyhapList(1);
    if(data.result == '')
    {
      _commonWidgets.customSnackbar('일시적 문제로 딜을 생성할 수 없어요.');
    }
    else{
      await DeviceManager.overLayClients();
      Get.toNamed(Routes.MAKEDEAL,
          arguments:{
            'phoneName' : phoneName,
            'phoneIdx' : '$phoneIdx',
            'phoneModel' : phoneModel,
            'phoneImg' : phoneImg,
            'invite' : ''
          }
      );
    }
  }

  Future<void> rankDeal({
    required BuildContext context,
    required String phoneName, required int phoneIdx, required String phoneModel, required String phoneImg}) async{
    SrcInfoController.to.infoM.value.mLatitude == '' || SrcInfoController.to.infoM.value.mLongitude == ''
        ?
    initSetting(context)
        :
    SrcDealController.to.currentDealList.isEmpty
        ? await getRankDeal(phoneName: phoneName, phoneIdx: phoneIdx, phoneModel: phoneModel, phoneImg: phoneImg)
        : Get.isSnackbarOpen
              ? Get.back()
              : _commonWidgets.customSnackbar('이미 생성한 딜이 있어요. 매장목록에서 원하는 매장에게 초대장을 보내보세요!');
  }


  void gotoReservation({
    required String smid,
    required int joinTkIdx,
    DealEstimateList? estimate,
  }) async{
    await DeviceManager.overLayClients();
    Get.to(
            () => ReservationView(
              estimate: estimate,
              joinTkIdx: joinTkIdx,
            ),
        arguments: smid,
        binding: BindingsBuilder(
                () {
                  Get.put(ReservationController(
                      bdBotNavRepository: _bdBotNavRepository,
                      commonWidgets: _commonWidgets
                  ));
                  }
                )
    );
  }

}