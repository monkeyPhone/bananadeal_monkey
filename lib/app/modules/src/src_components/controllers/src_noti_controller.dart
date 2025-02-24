import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/managers/device_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/main/auth/auth_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/controllers/chat_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/estimate_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/alert_noti_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/alert_view.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../components/common_widgets.dart';
import '../../../../components/future_loading_overlay.dart';
import '../../../../models/fcm/paygroup.dart';
import '../../../../models/fcm/payload.dart';
import '../../pages/deal/controllers/deal_controller.dart';
import '../bottom_nav_bar/controllers/bd_bot_nav_chat_controller.dart';
import '../bottom_nav_bar/controllers/bd_bot_nav_controller.dart';

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}


class SrcNotiController extends GetxController{

  static SrcNotiController get to => Get.find();

  final CommonWidgets _commonWidgets;

  SrcNotiController({
    required CommonWidgets commonWidgets,
  }) : _commonWidgets = commonWidgets;

  RxList<NotiPayLoad> notiDeal = <NotiPayLoad>[].obs;
  RxList<NotiPayLoad> notiChat = <NotiPayLoad>[].obs;
  RxList<NotiPayLoad> notiEtc = <NotiPayLoad>[].obs;

  RxList<NotiPayLoad> notiDealBack = <NotiPayLoad>[].obs;
  RxList<NotiPayLoad> notiDealFront = <NotiPayLoad>[].obs;
  RxList<NotiPayLoad> notiChatBack = <NotiPayLoad>[].obs;
  RxList<NotiPayLoad> notiChatFront = <NotiPayLoad>[].obs;
  RxList<NotiPayLoad> notiEtcBack = <NotiPayLoad>[].obs;
  RxList<NotiPayLoad> notiEtcFront = <NotiPayLoad>[].obs;

  RxInt cacheNotiDeal = 0.obs;
  RxInt cacheNotiEtc = 0.obs;

  RxInt change = 0.obs;

  void getCacheNotiDeal(int cache){
    cacheNotiDeal.value = cache;
    update();
  }

  void getCacheNotiEtc(int cache){
    cacheNotiEtc.value = cache;
    update();
  }

  Future<void> receiveNotiBack1() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    String? pay = prefs.getString('groupRouteBack');
    String? payDeal = prefs.getString('groupDealBack');
    String? payChat = prefs.getString('groupChatBack');
    String? payEtc = prefs.getString('groupEtcBack');
    String? payStop = prefs.getString('groupStop');
    int? cacheDeal = prefs.getInt('notiDealLength');
    int? cacheEtc = prefs.getInt('notiEtcLength');
    getCacheNotiDeal(cacheDeal ?? 0);
    getCacheNotiEtc(cacheEtc ?? 0);
    if(payDeal != null){
      PayGroup list1 = payGroupFromJson(payDeal);
      notiDealBack.value = list1.data;
      update();
    }
    if(payChat != null){
      PayGroup list2 = payGroupFromJson(payChat);
      notiChatBack.value = list2.data;
      update();
    }
    if(payEtc != null){
      PayGroup list3 = payGroupFromJson(payEtc);
      notiEtcBack.value = list3.data;
      update();
    }
  }

  Future<void> receiveNotiBack2() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    String? payDeal = prefs.getString('groupDealBack');
    String? payChat = prefs.getString('groupChatBack');
    String? payStop = prefs.getString('groupStop');
    String? payEtc = prefs.getString('groupEtcBack');

    if(payDeal != null){
      PayGroup list1 = payGroupFromJson(payDeal);
      notiDealBack.value = list1.data;
      update();
      await SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx.toInt());
      try{
        if(ChatLogController.to.initialized){
          await ChatLogController.to.refreshInfo();
        }else{
          await SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx.toInt());
        }
      } catch(_){
        try{
          if(EstimatedController.to.initialized){
            await EstimatedController.to.refreshButton();
          } else{
            await SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx.toInt());
          }
        } catch(_){
          await SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx.toInt());

        }
      }

    }
    if(payChat != null){
      PayGroup list2 = payGroupFromJson(payChat);
      notiChatBack.value = list2.data;
      await BdBotNavChatController.to.notiUpdate();
      update();
    }
    if(payEtc != null){
      PayGroup list3 = payGroupFromJson(payEtc);
      notiEtcBack.value = list3.data;
      update();
      if(notiEtcBack.where((element) => element.name == 'logout').isNotEmpty){
        AuthController.to.tokenEnd(false);
      }
    }
    if(payStop != null){
      await SrcInfoController.to.statusCheckRe();
      await prefs.remove('groupStop');
    }

    getNotiLength();
    _localNotiAction(prefs);

  }


   _localNotiAction(SharedPreferences prefs) async{
    String? pay = prefs.getString('groupRouteBack');
    if(pay != null){
      NotiPayLoad noti = notiPayLoadFromJson(pay);
      List<String> payload = noti.type.split(',');
      switch(payload.first){
        case 'banana_push' :
          try {
            if (ChatLogController.to.initialized) {
              // ChatLogController.to. moveScrollInit();
            }
          } catch(_){
            await moveToChat(payload.last);
          }
        case 'banana_deal' :
          await moveToEstimate(payload.last);
        default :
          await moveToAlert();
      }
    }
    else {

    }
    Timer(Duration(milliseconds: 500),
            (){
          prefs.remove('groupRouteBack');
        }
    );
  }


  Future<void> moveToScreen(int index) async{
    await showFutureLoadingOverlay<dynamic>(
        context: Get.context!,
        future: BdBotNavController.to.valueChanged(index),
        expanded: true
    );
  }

  Future<void> moveToChat(String roomIdx) async{
    await moveToScreen(3);
    ChatController.to.roomClick(roomIdx: int.parse(roomIdx), isChatList: false);
  }

  Future<void> moveToAlert() async{
    await moveToScreen(0);
    alertButtonClick('out');
  }

  Future<void> moveToEstimate(String title) async{
    await moveToScreen(2);
    if(!title.contains('종료')){
      DealController.to.gotoEstimateView(SrcDealController.to.currentDealList.first, 0);
    }
  }


  Future<void> receiveNotiFront() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    String? payDeal = prefs.getString('groupDealFront');
    String? payChat = prefs.getString('groupChatFront');
    String? payEtc = prefs.getString('groupEtcFront');
    int? cacheDeal = prefs.getInt('notiDealLength');
    int? cacheEtc = prefs.getInt('notiEtcLength');
    getCacheNotiDeal(cacheDeal ?? 0);
    getCacheNotiEtc(cacheEtc ?? 0);

    if(payDeal != null){
      PayGroup list1 = payGroupFromJson(payDeal);
      notiDealFront.value = list1.data;
      update();
    }
    if(payChat != null){
      PayGroup list2 = payGroupFromJson(payChat);
      notiChatFront.value = list2.data;
      update();
    }
    if(payEtc != null){
      PayGroup list3 = payGroupFromJson(payEtc);
      notiEtcFront.value = list3.data;
      update();
    }

  }


  Future<void> receiveDealFront() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    String? payDeal = prefs.getString('groupDealFront');
    int mIdx = SrcInfoController.to.infoM.value.mIdx;
    if(payDeal != null){
      PayGroup list1 = payGroupFromJson(payDeal);
      notiDealFront.value = list1.data;
      update();
      getNotiLength();
      try{
        if(ChatLogController.to.initialized){
          await ChatLogController.to.refreshInfo();
        }else{
          await SrcDealController.to.getDealDataPage(mIdx);
        }
      } catch(_){
        try{
          if(EstimatedController.to.initialized){
            await EstimatedController.to.refreshButton();
          } else{
            await SrcDealController.to.getDealDataPage(mIdx);
          }
        } catch(_){
          await SrcDealController.to.getDealDataPage(mIdx);

        }
      }

    }

  }

  Future<void> receiveChatFront() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    String? payChat = prefs.getString('groupChatFront');
    if(payChat != null){
      PayGroup list2 = payGroupFromJson(payChat);
      notiChatFront.value = list2.data;
      update();
      getNotiLength();
      await BdBotNavChatController.to.notiUpdate();
    }
  }

  Future<void> receiveEtcFront() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    String? payEtc = prefs.getString('groupEtcFront');

    if(payEtc != null){
      PayGroup list3 = payGroupFromJson(payEtc);
      notiEtcFront.value = list3.data;
      update();
      getNotiLength();
    }
  }

  void getNotiLength(){
      notiDeal.clear();
      notiChat.clear();
      notiEtc.clear();
      notiDeal.addAll(notiDealFront);
      notiDeal.addAll(notiDealBack);
      notiChat.addAll(notiChatFront);
      notiChat.addAll(notiChatBack);
      notiEtc.addAll(notiEtcFront);
      notiEtc.addAll(notiEtcBack);
      update();
  }



  void deleteNotiDeal(){
    notiDeal.clear();
    notiDealBack.clear();
    notiDealFront.clear();
    update();
  }

  Future<void> deleteNotiChat() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    await prefs.remove('groupChatFront');
    await prefs.remove('groupChatBack');
    notiChat.clear();
    notiChatBack.clear();
    notiChatFront.clear();
    getNotiLength();
    update();
  }

  Future<void> deleteNotiEtc() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    await prefs.remove('groupEtcFront');
    await prefs.remove('groupEtcBack');
    notiEtc.clear();
    notiEtcBack.clear();
    notiEtcFront.clear();
    getNotiLength();
    update();
  }
  
  void gotoAlert(String out) async{
    await DeviceManager.overLayClients();
    Get.to(
            () => AlertView(),
        arguments: out,
        binding: BindingsBuilder(
                () {
              Get.put(AlertNotiController(
                commonWidgets: _commonWidgets
              ));
            }
        )
    );
  }

  void alertButtonClick(String out){
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      notiDeal.isNotEmpty ||notiEtc.isNotEmpty
          ? gotoAlert(out)
          : _commonWidgets.customSnackbar('현재 알림이 없어요.');
    }
  }




  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Timer(
      Duration(seconds: 1),
        () async{
          await receiveNotiBack1();
          await receiveNotiFront();
          try{
            await BdBotNavChatController.to.circulateRead();
          } catch(_){

          }
          _localNotiAction(prefs);
          getNotiLength();
        }
    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

  }

}