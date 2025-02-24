import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/models/deal/deal_list_page.dart';
import 'package:banana_deal_by_monkeycompany/app/models/deal/page_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/controller/invite_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/view/invite_deal_view.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_estimate_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/deal/make_deal_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/nav/deal/deal_status.dart';
import '../../../../models/src/deal/user_deal.dart';
import '../../../../repository/bdbot/bd_bot_nav_rapository.dart';
import '../../../../repository/src/src_deal_repository.dart';


class SrcDealController extends GetxController {
  static SrcDealController get to => Get.find();

  final SrcDealRepository  _srcDealRepository;
  final BdBotNavRepository _bdBotNavRepository;
  final MakeDealRepository _makeDealRepository;
  final CommonWidgets _commonWidgets;
  SrcDealController({
    required SrcDealRepository srcDealRepository,
    required BdBotNavRepository bdBotNavRepository,
    required MakeDealRepository makeDealRepository,
    required CommonWidgets commonWidgets,
  }) : _srcDealRepository = srcDealRepository,
  _bdBotNavRepository = bdBotNavRepository,
        _makeDealRepository = makeDealRepository,
        _commonWidgets = commonWidgets;

  late ScrollController sController;

  RxInt dealStatusNumber = 0.obs;
  RxInt currentPage = 1.obs;
  RxBool loading = false.obs;

  RxInt inviteCnt = 0.obs;

  Rx<AllPageInfo> pageInfo = AllPageInfo(total: 0, totalPages: 0).obs;

  RxList<DealStatusList> dealList = <DealStatusList>[].obs;
  RxList<UserDealInfo> currentMyDeal = <UserDealInfo>[].obs;
  RxList<DealStatusList> currentDealList = <DealStatusList>[].obs;
  List estimateSortName = ['월 납부액 순', '할부원금 순', '가까운 순'];

  Future<void> outUpdateInvite({
    required int diIdx
  }) async{
    inviteCnt.value = await _srcDealRepository.getIsInvite(diIdx: diIdx);
  }

  Future<void> getDealDataPage(int mIdx) async{
    try{
      UserDeal dealInfos = await _srcDealRepository.getDealInfo(mIdx: mIdx);
      if(dealInfos.result.isNotEmpty){
        await outUpdateInvite(diIdx: dealInfos.result.first.diIdx);
      }
      dealStatusNumber.value = dealInfos.status;
      currentMyDeal.value = dealInfos.result;
      update();
      await reloadDealList(mIdx);
    } catch(_){
      dealStatusNumber.value = 508;
      update();
    }


  }

  void moveScrollInit(){
    if( sController.hasClients){
      sController.jumpTo(0.0);
    }
  }

  void clickUpdate(){
    update();
  }

  void minusMaxPage(int total){
    if(currentPage.value > total){
      currentPage.value = total;
      update();
    }
  }

  Future<void> getDealDataInits(int mIdx) async{

    loading.value = true;
    dealStatusNumber.value = 0;
    currentPage.value = 1;
    update();
    try{
      moveScrollInit();
      UserDeal dealInfos = await _srcDealRepository.getDealInfo(mIdx: mIdx);
      if(dealInfos.result.isNotEmpty){
        await outUpdateInvite(diIdx: dealInfos.result.first.diIdx);
      }
      dealStatusNumber.value = dealInfos.status;
      currentMyDeal.value = dealInfos.result;
      update();
      await reloadDealList(mIdx);
    } catch(_){
      dealStatusNumber.value = 508;
      update();
    }
    loading.value = false;
    update();
  }

  Future<void> reloadDealList(int mIdx) async{
    loading.value = true;
    update();
    List<DealStatusList> deal = [];
    for(int i = 1; i <= currentPage.value; i++){
      deal.addAll(await getDealStatus(mIdx: mIdx, currentPae: i));
    }
    if(deal.isNotEmpty){
      if(deal.where((e) => e.diStatus == '진행중').isNotEmpty){
        currentDealList.value = [deal.firstWhere((e) => e.diStatus == '진행중')];
        update();
        if(currentDealList.isNotEmpty){
          await SrcEstimateController.to.makeEstimate(diIdx:currentDealList.first.diIdx);
        }
      }
      else{
        currentDealList.value = [];
        update();
      }
    }
    dealList.value = deal;
    loading.value = false;
    update();
  }

  Future<List<DealStatusList>> getDealStatus({
    required int mIdx,
    required int currentPae,
  }) async{
   try{
     DealListPage deal = await _srcDealRepository.getDealStatus(mIdx: mIdx, page: currentPae);
     dealStatusNumber.value = deal.status;
     update();
     if(deal.status == 200)
     {
       minusMaxPage(deal.result.first.totalPages);
       pageInfo.value = AllPageInfo(
        total: deal.result.first.total,
        totalPages: deal.result.first.totalPages
       );
       update();
       return deal.result.first.list;
     }
     else{
      pageInfo.value = AllPageInfo(total: 0, totalPages: 0);
      update();
      return [];
     }
   } catch(_){
      dealStatusNumber.value = 508;
      pageInfo.value = AllPageInfo(total: 0, totalPages: 0);
      update();
      return [];
   }
  }




  Future<void> getDealStatusAdd() async{
    int mIdx = SrcInfoController.to.infoM.value.mIdx;
    loading.value = true;
    currentPage.value++;
    update();
    try{
      DealListPage deal = await _srcDealRepository.getDealStatus(mIdx: mIdx, page: currentPage.value);
      dealStatusNumber.value = deal.status;
      update();
      if(deal.result.isNotEmpty)
      {
        dealList.addAll(deal.result.first.list);
        update();
      }
      else{

    }
    } catch(_){
      dealStatusNumber.value = 508;
      dealList.clear();
    }
    loading.value = false;
    update();
  }

  void gotoInvite(){
    Get.to(
            () => InviteDealView(
              isClose: true,
            ), binding:
    BindingsBuilder(() {
      Get.put(InviteDealController(
        bdBotNavRepository: _bdBotNavRepository,
        commonWidgets: _commonWidgets,
        makeDealRepository: _makeDealRepository,
        isChat: null, storeId: '', diIdx: currentMyDeal.first.diIdx,

      ));
    })
    );
  }

bool isInt(String str) {
  return int.tryParse(str) != null;
}

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sController = ScrollController();
    sController.addListener(() async{
      if(pageInfo.value.totalPages > currentPage.value){
        if(sController.position.pixels == sController.position.maxScrollExtent) {
          await getDealStatusAdd();
        }
      }
    });
  }



  @override
  void dispose() {
    // TODO: implement dispose
    sController.dispose();
    super.dispose();
  }


}