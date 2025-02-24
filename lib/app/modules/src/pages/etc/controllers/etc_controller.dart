import 'package:banana_deal_by_monkeycompany/app/components/common_dialog/common_widgets_2.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/image/image_dialog_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/etc/etc_etc_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/etc/etc_event_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/etc/etc_info_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/sign/sign_5_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/store/store_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../components/common_widgets.dart';
import '../../../../../managers/device_manager.dart';
import '../../../../../models/auth_basic_api.dart';
import '../../../../../models/etc/user_block.dart';
import '../../../../../models/etc/user_review.dart';
import '../../../../../repository/etc/bookmark_repository.dart';
import '../../../../../repository/src/src_info_repository.dart';
import '../../../../../routes/error_handling.dart';
import '../../../../main/loading/loading_controller.dart';
import '../../../src_components/controllers/src_info_controller.dart';
import '../views/components/etc_app_settting/etc_app_setting_view.dart';
import '../views/components/etc_block_setting/etc_block_setting_view.dart';
import '../views/components/etc_bookmark_setting/etc_bookmark_setting_view.dart';
import '../views/components/etc_event/etc_event_controller.dart';
import '../views/components/etc_event/etc_event_view.dart';
import '../views/components/etc_inquiry/etc_inquiry_controller.dart';
import '../views/components/etc_inquiry/etc_inquiry_view.dart';
import '../views/components/etc_my_info_settting/etc_my_info_setting_view.dart';
import '../views/components/etc_notice/etc_notice_controller.dart';
import '../views/components/etc_notice/etc_notice_view.dart';
import '../views/components/etc_review_setting/etc_review_setting_view.dart';
import '../views/components/etc_some_inquiry/etc_some_inquiry_controller.dart';
import '../views/components/etc_some_inquiry/etc_some_inquiry_view.dart';
import '../views/components/etc_terms_of_use/etc_terms_of_use_controller.dart';
import '../views/components/etc_terms_of_use/etc_terms_of_use_view.dart';
import 'etc_app_setting_controller.dart';
import 'etc_block_setting_controller.dart';
import 'etc_bookmark_setting_controller.dart';
import 'etc_my_info_setting_controller.dart';
import 'etc_review_setting_controller.dart';

class EtcController extends GetxController {
  static EtcController get to => Get.find();

  final ImageDialogManager _imageDialogManager;
  final EtcEventRepository _etcEventRepository;
  final EtcInfoRepository _etcInfoRepository;
  final BookmarkRepository _bookmarkRepository;
  final StoreRepository _storeRepository;
  final EtcEtcRepository _etcEtcRepository;
  final Repo5 _repo5;
  final SrcInfoRepository _srcInfoRepository;
  final CommonWidgets _commonWidgets;
  final CommonWidgets2 _commonWidgets2;

  EtcController({
    required ImageDialogManager imageDialogManager,
    required EtcEventRepository etcEventRepository,
    required EtcInfoRepository etcInfoRepository,
    required BookmarkRepository bookmarkRepository,
    required StoreRepository storeRepository,
    required EtcEtcRepository etcEtcRepository,
    required Repo5 repo5,
    required SrcInfoRepository srcInfoRepository,
    required CommonWidgets commonWidgets,
    required CommonWidgets2 commonWidgets2,
  }) :  _imageDialogManager = imageDialogManager,
        _etcEventRepository = etcEventRepository,
        _etcInfoRepository = etcInfoRepository,
        _bookmarkRepository = bookmarkRepository,
        _storeRepository = storeRepository,
        _etcEtcRepository = etcEtcRepository,
        _repo5 = repo5,
        _srcInfoRepository = srcInfoRepository,
        _commonWidgets = commonWidgets,
        _commonWidgets2 = commonWidgets2;

  late ScrollController sController;
  late ScrollController useController;

  GestureTapCallback onTap0(){
    return () async{
      await DeviceManager.overLayClients();
      Get.to(
              () => EtcAppSettingView(), binding:
      BindingsBuilder(() {
        Get.put(EtcAppSettingController(
            srcInfoRepository: _srcInfoRepository,
            etcEtcRepository: _etcEtcRepository,
            commonWidgets: _commonWidgets,
            commonWidgets2: _commonWidgets2
        ));
      }));
    };
  }

  GestureTapCallback onTap1(){
    return () async{
      await DeviceManager.overLayClients();
      Get.to(
              () => EtcMyInfoSettingView(), binding:
      BindingsBuilder(() {
        Get.put(EtcMyInfoSettingController(
            srcInfoRepository: _srcInfoRepository,
            repo5: _repo5,
            commonWidgets: _commonWidgets,
            commonWidgets2: _commonWidgets2, etcInfoRepository: _etcInfoRepository
        ));
      }));
    };
  }

  GestureTapCallback onTap2(){
    return () async{
      await DeviceManager.overLayClients();
      Get.to(
              () => EtcBookMarkSettingView(), binding:
      BindingsBuilder(() {
        Get.put(EtcBookmarkSettingController(
            bookmarkRepository: _bookmarkRepository,
            storeRepository: _storeRepository
        ));
      }));
    };
  }

  Future<void> getReviewList() async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      UserReview api = await LoadingController.to.apiLoadings(
          future: _bookmarkRepository.getUserReviewList(),
          text: Style.infoMent
      );

      if (api.result.isNotEmpty) {
        Get.to(
                () => EtcReviewSettingView(), binding:
        BindingsBuilder(() {
          Get.put(EtcReviewSettingController(
              bookmarkRepository: _bookmarkRepository,
              commonWidgets: _commonWidgets
          ));
        }));
      }
      else {
        if(api.status == 200)
        {
          _commonWidgets.customSnackbar('상담을 진행한 딜이 없어서 리뷰를 작성할 수 없어요.');
        }
        else{
          ErrorManager.errorCodeReturn(status: api.status, funcRoute: 'BookmarkRepository-getUserReviewList', error: 'Y', msg: api.msg, apiRoute: '${ApiConsole.bananaPrivateUrl}/review/list');
        }
      }
    }
  }

  GestureTapCallback onTap3(){
    return () async{
      await getReviewList();
    };
  }

  Future<void> getBlockList() async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      UserBlock api = await LoadingController.to.apiLoadings(
          future: _bookmarkRepository.getUserBlockList(SrcInfoController.to.infoM.value.mIdx),
          text: Style.infoMent
      );
      if (api.result.isNotEmpty) {
        if(!Get.isSnackbarOpen ){
          await DeviceManager.overLayClients();
          Get.to(
                  () => EtcBlockSettingView(), binding:
          BindingsBuilder(() {
            Get.put(EtcBlockSettingController(
                commonWidgets: _commonWidgets,
                bookmarkRepository: _bookmarkRepository
            ));
          }));
        }

      }
      else {
        if(api.status == 200)
        {
          _commonWidgets.customSnackbar('차단 중인 매장 혹은 유저가 없습니다.');
        }
        else{
          _commonWidgets.customSnackbarErrorMessage('오류 발생');
        }
      }
    }
  }

  GestureTapCallback onTap4(){
    return () async{
      await getBlockList();
    };
  }

  GestureTapCallback onTap5(){
    return () async{
      await DeviceManager.overLayClients();
      Get.to(
              () => EtcNoticeView(), binding:
      BindingsBuilder(() {
        Get.put(EtcNoticeController(
            imageDialogManager: _imageDialogManager,
            etcEtcRepository: _etcEtcRepository
        ));
      }));
    };
  }

  GestureTapCallback onTap6(){
    return () async{
      await DeviceManager.overLayClients();
      Get.to(
              () => EtcEventView(), binding:
      BindingsBuilder(() {
        Get.put(EtcEventController(
            etcEventRepository: _etcEventRepository,
            commonWidgets: _commonWidgets
        ));
      }));
    };
  }

  GestureTapCallback onTap7(){
    return () async{
      await DeviceManager.overLayClients();
      Get.to(
              () => EtcInQuiryView(), binding:
      BindingsBuilder(() {
        Get.put(EtcInquiryController(
            imageDialogManager: _imageDialogManager,
            commonWidgets: _commonWidgets,
            etcEtcRepository: _etcEtcRepository
        ));
      }));
    };
  }

  GestureTapCallback onTap8(){
    return () async{
      await DeviceManager.overLayClients();
      Get.to(
              () => EtcSomeInQuiryView(), binding:
      BindingsBuilder(() {
        Get.put(EtcSomeInquiryController(
          etcEtcRepository: _etcEtcRepository
        ));
      }));
    };
  }

  GestureTapCallback onTap9(){
    return () async{
      await DeviceManager.overLayClients();
      Get.to(
              () => EtcTermsOfUseView(), binding:
      BindingsBuilder(() {
        Get.put(EtcTermsOfUseController(
          etcEtcRepository: _etcEtcRepository
        ));
      }));
    };
  }

  Future<void> etcBanCall() async{
    final AuthBagicApi api = await _srcInfoRepository.checkPause();
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      if(api.status == 200)
      {
        await SrcInfoController.to.updateUserInfo();
        _commonWidgets.customSnackbar('이용정지가 해제 되었어요.');
      } else{
        _commonWidgets.customSnackbar('아직 이용정지 중입니다. 더보기 - 1:1문의에서 문의해주세요.');
      }
    }
  }



  void _controllerClose(){
    sController.dispose();
    useController.dispose();

  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sController = ScrollController();
    useController = ScrollController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }

}