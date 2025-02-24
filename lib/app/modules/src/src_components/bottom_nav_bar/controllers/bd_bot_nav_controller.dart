import 'dart:async';
import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/controllers/chat_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_banner_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_estimate_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_noti_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_rank_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../pages/store/controllers/store_controller.dart';
import '../../controllers/src_deal_controller.dart';
import '../../controllers/src_info_controller.dart';
import '../../controllers/src_route_controller.dart';
import 'bd_bot_nav_chat_controller.dart';



enum PageName{HOME, STORE, DEAL, CHAT, OTHER}


class BdBotNavController extends GetxController{

  static BdBotNavController get to => Get.find();

  final CommonWidgets _commonWidgets;
  BdBotNavController({
    required CommonWidgets commonWidgets,
  }) : _commonWidgets = commonWidgets;


  RxInt pageIndex = 0.obs;
  RxInt pageSrcChangeIndex = 0.obs;
  RxInt pageFloatingChangeIndex = 0.obs;

  // TODO: check 수정해야 됨

  valueChanged(value) async{
    if(ChatController.to.openDialog.value != 3){
      changeBottomNav(value);
      switch(pageIndex.value){
        case 0:
          if(SrcInfoController.to.infoM.value.mIsUsed != '이용중'){
          }else{
            if(SrcInfoController.to.infoM.value.mLatitude == '' || SrcInfoController.to.infoM.value.mLongitude == ''){
              SrcRouteController.to.initSetting(Get.context!);
            }
            else{
              await SrcBannerController.to.getBannerData();
            }
            SrcRankController.to.homeController.hasClients ?
            SrcRankController.to.homeController.jumpTo(0.0) : null;
            SrcRankController.to.scrollController.hasClients ?
            SrcRankController.to.scrollController.jumpTo(0.0) : null;
          }
        case 1:
          if(SrcInfoController.to.infoM.value.mIsUsed != '이용중'){
          }else{
            if(SrcInfoController.to.infoM.value.mLatitude == '' || SrcInfoController.to.infoM.value.mLongitude == ''){
              SrcRouteController.to.initSetting(Get.context!);
            }
            else{
              await StoreController.to.switchStoreApi(start:0, index:StoreController.to.currentButton.value);
            }
            SrcRankController.to.homeController.hasClients ?
            SrcRankController.to.homeController.jumpTo(0.0) : null;
            SrcRankController.to.scrollController.hasClients ?
            SrcRankController.to.scrollController.jumpTo(0.0) : null;
          }
        case 2:
          if(SrcInfoController.to.infoM.value.mIsUsed != '이용중'){
          }else{
            SrcDealController.to.getDealDataInits(SrcInfoController.to.infoM.value.mIdx);
          }
        case 3:
          if(SrcInfoController.to.infoM.value.mIsUsed != '이용중'){

          }else{
            await BdBotNavChatController.to.errorInit();
            await SrcNotiController.to.deleteNotiChat();
          }
      }
    }
  }

  void goHome(){
    pageIndex.value = 0;
    pageSrcChangeIndex.value = 0;
    pageFloatingChangeIndex.value = 0;
  }

  changeBottomNav(int value) {
    var page = PageName.values[value];
    switch(page) {
      case PageName.HOME:
      case PageName.DEAL:
      case PageName.CHAT:
      case PageName.OTHER:
        changePage(value);
        break;
      case PageName.STORE:
        changePage(value);
        break;
    }
  }

  //네비 함수
  changePage(int value) {
    pageIndex(value);
    pageSrcChangeIndex(value);
    pageFloatingChangeIndex(value);
  }

  void srcBackFunc(BuildContext context){
    if(pageIndex.value == 0){
      _commonWidgets.customDialog(
          routerContext: context,
          barrierDismissible: true,
          mainText: '앱을 종료하시겠어요?', cancleText: '취소', confirmText: '종료',
          conFirmOnTap: () async{
            GetPlatform.isAndroid ? await SystemNavigator.pop()
                                  : GetPlatform.isIOS
                                       ?  exit(0)
                                       : null;
          }
      );
    } else{
      goHome();
    }
  }

//백버튼 제어


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debounce(pageIndex, (_) {
      Timer(const Duration(milliseconds: 100),
              (){
            if(pageIndex.value == 0 && SrcEstimateController.to.estimateSort.value == 2)
            {
              SrcEstimateController.to.sortEstimateList(0);
            }
          }
      );

    });
  }
}
