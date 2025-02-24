import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../components/common_widgets.dart';
import '../../../../../../../models/fcm/paygroup.dart';
import '../../../../../../../models/fcm/payload.dart';
import '../../../../../src_components/controllers/src_noti_controller.dart';

class AlertNotiController extends GetxController with GetSingleTickerProviderStateMixin{
  static AlertNotiController get to => Get.find();

  final CommonWidgets _commonWidgets;
  AlertNotiController({
    required CommonWidgets commonWidgets,
  }) : _commonWidgets = commonWidgets;

  //TODO: 탭 컨트롤러

  late TabController tabController;
  RxInt currentTap = 0.obs;

  RxBool dealBadge = false.obs;
  RxBool etcBadge = false.obs;

  void updateDealBadge(bool r){
    dealBadge.value = r;
    update();
  }

  void updateEtcBadge(bool r){
    etcBadge.value = r;
    update();
  }

  void tabselect() {
    currentTap.value = tabController.index;
    tabController.index == 1
        ? updateEtcBadge(false)
        : updateDealBadge(false);
  }

  Future<void> getReadCache() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('notiDealLength', notiDeal.length);
    await prefs.setInt('notiEtcLength', notiEtc.length);
    int? cacheDeal = await prefs.getInt('notiDealLength');
    int? cacheEtc = await prefs.getInt('notiEtcLength');
    SrcNotiController.to.getCacheNotiDeal(cacheDeal ?? 0);
    SrcNotiController.to.getCacheNotiEtc(cacheEtc ?? 0);
  }

  String imageBananaCat = "https://i.pinimg.com/564x/22/77/f5/2277f5ec7281215c36c236d6d5a4b4a4.jpg";
  String imageReviewCat = "https://i.pinimg.com/564x/3b/f6/6e/3bf66ec25611550100efb9985e69d785.jpg";
  String imageTogether = "https://i.pinimg.com/564x/86/ca/25/86ca25654fe5cb83c332bdf91ab63851.jpg";
  String imageChatCat = "https://i.pinimg.com/564x/a6/ce/0b/a6ce0bf9c0a3059d46b8052b9d78fd73.jpg";
  String imageBananaCat2 = "https://i.pinimg.com/564x/03/bd/a0/03bda052a940ce0e67c9f4f6e8afb64e.jpg";
  String imageBananaCat3 = "https://i.pinimg.com/564x/01/53/23/0153237e1b6a95812ec6090af93e88f2.jpg";
  String imageBananaCat4 = "https://i.pinimg.com/736x/58/7e/55/587e55d07517eb0ce8484dcb97422295.jpg";

  ScrollController dealC = ScrollController();
  ScrollController etcC = ScrollController();

  RxList<NotiPayLoad> notiDeal = <NotiPayLoad>[].obs;
  RxList<NotiPayLoad> notiDealBack = <NotiPayLoad>[].obs;
  RxList<NotiPayLoad> notiDealFront = <NotiPayLoad>[].obs;

  RxList<NotiPayLoad> notiEtc = <NotiPayLoad>[].obs;
  RxList<NotiPayLoad> notiEtcBack = <NotiPayLoad>[].obs;
  RxList<NotiPayLoad> notiEtcFront = <NotiPayLoad>[].obs;


  RxInt change = 0.obs;

  Future<void> receiveNotiBack() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    String? payDeal = prefs.getString('groupDealBack');
    if(payDeal != null){
      PayGroup list1 = payGroupFromJson(payDeal);
      notiDealBack.value = list1.data;

    }
    String? payEtc = prefs.getString('groupEtcBack');
    if(payEtc != null){
      PayGroup list2 = payGroupFromJson(payEtc);
      notiEtcBack.value = list2.data;
    }
    update();
    getNotiLength();
  }

  Future<void> receiveNotiFront() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    String? payDeal = prefs.getString('groupDealFront');
    if(payDeal != null){
      PayGroup list1 = payGroupFromJson(payDeal);
      notiDealFront.value = list1.data;
    }
    String? payEtc = prefs.getString('groupEtcFront');
    if(payEtc != null){
      PayGroup list2 = payGroupFromJson(payEtc);
      notiEtcFront.value = list2.data;
    }
    update();
    getNotiLength();
  }

  void getNotiLength(){
    notiDeal.clear();
    notiDeal.addAll(notiDealFront);
    notiDeal.addAll(notiDealBack);
    notiDeal.sort((a,b)=> DateTime.parse(b.time).compareTo(DateTime.parse(a.time)));
    notiEtc.clear();
    notiEtc.addAll(notiEtcFront);
    notiEtc.addAll(notiEtcBack);
    notiEtc.sort((a,b)=> DateTime.parse(b.time).compareTo(DateTime.parse(a.time)));
    update();
  }

  Future<void> deleteDealNoti() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('groupDealFront');
    await prefs.remove('groupDealBack');
    await prefs.remove('notiDealLength');
    notiDeal.clear();
    notiDealBack.clear();
    notiDealFront.clear();
    update();
    SrcNotiController.to.deleteNotiDeal();
  }

  Future<void> deleteEtcNoti() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('groupEtcBack');
    await prefs.remove('groupEtcFront');
    await prefs.remove('notiEtcLength');
    notiEtc.clear();
    notiEtcBack.clear();
    notiEtcFront.clear();
    update();
    SrcNotiController.to.deleteNotiEtc();
  }

  void clickDeleteDealButton(BuildContext context) {
    _commonWidgets.customDialog(
        routerContext: context,
        barrierDismissible: false,
        mainText: '딜 알림 로그 기록을 삭제하시겠어요? 삭제된 데이터는 복구할 수 없어요.' ,
        cancleText: '취소', confirmText: '삭제', conFirmOnTap:
        () async{
      if(Get.isSnackbarOpen){
        Get.back();
      } else {
        notiDeal.isNotEmpty && currentTap.value == 0
            ? await deleteDealNoti()
            : null;
        Get.back();
      }
    });
  }

  void clickDeleteEtcButton(BuildContext context) {
    _commonWidgets.customDialog(
        routerContext: context,
        barrierDismissible: false,
        mainText: '전체 알림 로그 기록을 삭제하시겠어요? 삭제된 데이터는 복구할 수 없어요.',
        cancleText: '취소', confirmText: '삭제',
        conFirmOnTap:
            () async{
              if(Get.isSnackbarOpen){
                Get.back();
              } else {
                notiEtc.isNotEmpty && currentTap.value == 1 ? await deleteEtcNoti() : null;
                Get.back();
              }
           }
        );
  }

  void _controllerClose(){
    tabController.dispose();
    dealC.dispose();
    etcC.dispose();
  }

  Future<void> clickNotiAlert() async{
    await receiveNotiBack();
    await receiveNotiFront();
    updateDealBadge((SrcNotiController.to.notiDeal.length - SrcNotiController.to.cacheNotiDeal.value) > 0);
    updateEtcBadge((SrcNotiController.to.notiEtc.length - SrcNotiController.to.cacheNotiEtc.value) > 0);
  }


  @override
  void onInit() async{
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(tabselect);
    // TODO: implement onInit
    super.onInit();
    await receiveNotiBack();
    await receiveNotiFront();
    updateDealBadge((SrcNotiController.to.notiDeal.length - SrcNotiController.to.cacheNotiDeal.value) > 0);
    updateEtcBadge((SrcNotiController.to.notiEtc.length - SrcNotiController.to.cacheNotiEtc.value) > 0);
    if(Get.arguments == 'out'){
      currentTap.value = 1;
      update();
      tabController.index = 1;
    }
  }

  @override
  void onClose() async {
    _controllerClose();
    await getReadCache();
    super.onClose();

  }

}

