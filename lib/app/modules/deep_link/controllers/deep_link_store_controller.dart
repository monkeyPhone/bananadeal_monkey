import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/deeplink/guest_store_detail.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../components/carousel/src/helpers/carousel_controller.dart';
import '../../../managers/device_manager.dart';
import '../../../repository/app_repository.dart';
import '../../../routes/api_url.dart';
import '../../naver_maps/pages/naver_marker_static/naver_marker_static_controller.dart';
import '../../naver_maps/pages/naver_marker_static/naver_marker_static_view.dart';


class DeepLinkStoreController extends GetxController{

  late final CarouselController cController;
  late final ScrollController scrollController;

  final AppReopsitory _appRepository = const RegisterManager().getAppRepository();
  final CommonWidgets _commonWidgets = CommonWidgets();

  Rx<GuestStoreDetail> store = GuestStoreDetail(status: 0, msg: '', result: []).obs;
  Rx<GuestStoreDetailList> storeDetail =  GuestStoreDetailList(smMId: '', smStoreName: '', smAddress: '', smTel: '', smCity: '', smCity2: '', smCity3: '', smPathImg0: '',
      smPathImg1: '', smPathImg2: '', smPathImg3: '', smPathImg4: '', smPathImg5: '', smStoreIntroduce: '', smLatitude: '', smLongitude: '',
      smConsultationTime: '', smTimeStart: '', smTimeEnd: '', smEvent1: '', smEvent2: '', smEvent3: '', smIconEvent1: '', smIconEvent2: '',
      smIconEvent3: '', smRegdate: DateTime(0)).obs;

  List storePreView = [];
  List storeEvent = [];
  List storeIcon = [];

  //Store

  Future<GuestStoreDetail> getDetail({required int smIdx}) async{
    final GuestStoreDetail detail = await _appRepository.getStoreDetail(smIdx);
    if(detail.result.isNotEmpty)
    {
      storeDetail.value = detail.result.first;
      update();
      statusOk();
      return store.value = detail;
    }
    else{
      Get.back();
      _commonWidgets.customSnackbar('잘못된 접근입니다.');
      return store.value;
    }
  }

  void statusOk(){
    storePreView = [storeDetail.value.smPathImg0,
      storeDetail.value.smPathImg1, storeDetail.value.smPathImg2,
      storeDetail.value.smPathImg3, storeDetail.value.smPathImg4, storeDetail.value.smPathImg5];
    storePreView.removeWhere((element) => element == '');
    storeEvent = [storeDetail.value.smEvent1, storeDetail.value.smEvent2, storeDetail.value.smEvent3];
    storeIcon = [storeDetail.value.smIconEvent1, storeDetail.value.smIconEvent2, storeDetail.value.smIconEvent3];
    update();
  }

  RxInt current = 0.obs;

  void pageCanged(int index) {
    current.value = index;
  }

  // 시간 변환
  bool makeTime(){
    try{
      if(storeDetail.value.smTimeStart == '' || storeDetail.value.smTimeEnd == ''){
        return false;
      }
      else{
        int startHour = int.parse(storeDetail.value.smTimeStart.split(':')[0]);
        int startmin = int.parse(storeDetail.value.smTimeStart.split(':')[1]);
        int endHour = int.parse(storeDetail.value.smTimeEnd.split(':')[0]);
        int endmin = int.parse(storeDetail.value.smTimeEnd.split(':')[1]);
        DateTime now = DateTimeConfig().now;
        DateTime time = DateTime(now.year, now.month, now.day, now.hour, now.minute);
        DateTime startTime  = DateTime(now.year, now.month, now.day, startHour, startmin);
        DateTime endTime  = DateTime(now.year, now.month, now.day, endHour, endmin);
        bool isOpen = time.isAfter(startTime) && time.isBefore(endTime);
        update();
        return isOpen;
      }
    }catch(e){

      return false;
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> gotoMap({
    required String name,
    required String road, required double latitude, required double longtitude}) async{
    await DeviceManager.overLayClients();
    Get.to(
            () => NaverMarkerStaticView(
              name: name,
              road: road, latitude: latitude, longtitude: longtitude,), binding:
    BindingsBuilder(() {
      Get.put(NaverMarkerStaticController());
    }));
  }

  Future<void> shareStore(int smIdx) async{
    String message = "STORE/$smIdx";
    String encode = base64.encode(utf8.encode(message));
    String url = '${ApiConsole.shareMode}/$encode';
    await Share.share("'${storeDetail.value.smStoreName}'를 추천합니다. 바나나딜 앱에서 확인해보세요.\n$url");

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cController = CarouselController();
    scrollController = ScrollController();
  }


  @override
  void onClose() {
    scrollController.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}