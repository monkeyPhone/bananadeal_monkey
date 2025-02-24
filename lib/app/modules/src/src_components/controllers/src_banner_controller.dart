import 'package:banana_deal_by_monkeycompany/app/managers/image/image_dialog_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/etc/etc_etc_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/etc/etc_event_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../components/carousel/src/helpers/carousel_controller.dart';
import '../../../../components/common_widgets.dart';
import '../../../../models/src/banner/src_banner.dart';
import '../../../../models/src/banner/src_popup.dart';
import '../../../../repository/src/src_banner_repository.dart';
import '../../../main/auth/auth_controller.dart';
import '../../pages/etc/views/components/etc_event/etc_event_detail/etc_event_detail_view.dart';
import '../../pages/etc/views/components/etc_event/etc_event_detail/etc_evnet_detail_controller.dart';
import '../../pages/etc/views/components/etc_notice/etc_notice_controller.dart';
import '../../pages/etc/views/components/etc_notice/etc_notice_view.dart';
import '../widgets/src_widget.dart';

class SrcBannerController extends GetxController {
  static SrcBannerController get to => Get.find();

  final EtcEventRepository _etcEventRepository;
  final SrcBannerRepository _srcBannerRepository;
  final EtcEtcRepository _etcEtcRepository;
  final CommonWidgets _commonWidgets;
  final ImageDialogManager _imageDialogManager;

  SrcBannerController({
    required EtcEventRepository etcEventRepository,
    required SrcBannerRepository srcBannerRepository,
    required EtcEtcRepository etcEtcRepository,
    required CommonWidgets commonWidgets,
    required ImageDialogManager imageDialogManager
  }) : _etcEventRepository = etcEventRepository,
        _srcBannerRepository = srcBannerRepository,
        _etcEtcRepository = etcEtcRepository,
        _commonWidgets = commonWidgets,
        _imageDialogManager = imageDialogManager;


  /*
    TODO:// 배너 상태 관리
   */

  final CarouselController bannerController = CarouselController();


  RxList<SrcBannerList> bannerList = <SrcBannerList>[].obs;
  RxInt carouselPage = 0.obs;
  RxInt maxPage = 0.obs;

  Future<void> getBannerData() async {
    SrcBanner bannerApi = await _srcBannerRepository.getMainBanner();
    if(bannerApi.status == 200 && bannerApi.result.isNotEmpty){
      bannerList.value = bannerApi.result;
    }
    else{
      bannerList.value = [];
    }
    update();
  }

  void carouselPageChanged(int index) {
    carouselPage.value = index;
    update();
  }

  Future<void> launchInBrowser(String url) async {
    try{
      final Uri launchUri = Uri.parse(url);
      await launchUrl(launchUri, mode: LaunchMode.externalApplication);
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      _commonWidgets.customSnackbar(AppElement.pageMoveFail);
    }
  }

  late ScrollController detailScrollController;

  late TransformationController transformationController ;

  void resetInteractiveViewer() {
    transformationController.value = Matrix4.identity();
  }

  void openDialog({required BuildContext context, required String imageUrl, String? baseUrl})
  {
    _imageDialogManager.openImageDownLoad(
        baseUrl: baseUrl,
        imageUrl: imageUrl,
        routerContext: context, isDownload: true);
  }

  void closeBanner(){
    detailScrollController.dispose();
    transformationController.dispose();
    Get.back();
  }


  /*
    TODO:// 팝업 상태 관리
   */

  RxInt currentPopup = 0.obs;
  RxList<SrcPopupList> popupList = <SrcPopupList>[].obs;


  Future<void> getPopupData() async{
    SrcPopup popUp = await _srcBannerRepository.getMainPopup();
    if(popUp.status == 200 && popUp.result.isNotEmpty)
    {
      popupList.value = popUp.result;
      final bool today = await AuthController.to.checkShowPage();
      today ? SrcWidget().showBottomSheet(context: Get.context!,index:currentPopup.value, popup: popupList) : null;
    }
    else{
      popupList.value = [];
    }
    update();
  }

  void minusDegreed(){
    currentPopup.value == 0
        ? null : currentPopup.value--;
    update();
  }

  void plusDegreed(){
    popupList.length-1 == currentPopup.value
        ? null : currentPopup.value++;
    update();
  }
  
  Future<void> moveEvent(int current) async{
      Get.to(
              () => EtcEventDetailView(eventIdx: int.parse(popupList[current].pmEvent), email: SrcInfoController.to.infoM.value.mEmail,), binding:
      BindingsBuilder(() {
        Get.put(EtcEventDetailController(
            etcEventRepository: _etcEventRepository,
            commonWidgets: _commonWidgets
        ));
      }));
  }
  
  void moveNotice(String other){
    Get.to(
          () => EtcNoticeView(
      ),
      arguments: {'other': other},
      binding: BindingsBuilder(() {
        Get.put(EtcNoticeController(
          imageDialogManager: _imageDialogManager,
          etcEtcRepository: _etcEtcRepository
        ));
      }),
    );
}

  void functionRouterByPopupIdx(int current, BuildContext context) async{
    switch(popupList[current].pmCategory) {
      case "URL":
        await launchInBrowser(popupList[current].pmUrl);
        break;
      case "이미지":
        openDialog(
           context: context,
           imageUrl: popupList[current].pmImgPathImg
        );
        break;
      case "이벤트":
        moveEvent(current);
        break;
      case "공지사항":
        moveNotice(popupList[current].pmNotice);
        break;
      default:
        break;
    }
  }




  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getBannerData();
    await getPopupData();
  }

}