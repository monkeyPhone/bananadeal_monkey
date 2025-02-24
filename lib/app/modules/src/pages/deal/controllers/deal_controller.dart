import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/repository/deal/deal_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/estimate/estimate_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../components/common_widgets.dart';
import '../../../../../components/future_loading_overlay.dart';
import '../../../../../css/style.dart';
import '../../../../../managers/device_manager.dart';
import '../../../../../models/auth_basic_api.dart';
import '../../../../../models/nav/deal/deal_status.dart';
import '../../../../../models/src/deal/user_deal.dart';
import '../../../../main/loading/loading_controller.dart';
import '../../../src_components/controllers/src_deal_controller.dart';
import '../../../src_components/controllers/src_info_controller.dart';
import '../../../../../repository/src/src_deal_repository.dart';
import '../../../src_components/controllers/src_noti_controller.dart';
import '../components/estimate/estimate_controller.dart';
import '../components/estimate/estimate_view.dart';
import '../views/components/management_button/end_deal_management_dialog.dart';

class DealController extends GetxController {
  static DealController get to => Get.find();

  final SrcDealRepository _srcDealRepository;
  final SrcEstimateRepository _srcEstimateRepository;
  final DealRepository _dealRepository;
  final CommonWidgets _commonWidgets;

  DealController({
    required SrcDealRepository srcDealRepository,
    required SrcEstimateRepository srcEstimateRepository,
    required DealRepository dealRepository,
    required CommonWidgets commonWidgets
  }) : _srcDealRepository = srcDealRepository,
        _srcEstimateRepository = srcEstimateRepository,
       _dealRepository = dealRepository,
       _commonWidgets = commonWidgets;




  RxBool refreshClick = false.obs;

  RxBool buttonClick = false.obs;



  Future<void> clickRefresh(BuildContext? context, bool isInit) async{
    bool next = await _checkServerStatus();
    if(next == true){
      SrcDealController.to.moveScrollInit();
        isInit ? await SrcDealController.to.getDealDataInits(SrcInfoController.to.infoM.value.mIdx.toInt())
           : await SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx.toInt());
      Timer(const Duration(milliseconds: 50),
              () async{
            refreshClick.value = true;
            update();

            Timer(const Duration(milliseconds: 200),
                    () {
                  refreshClick.value = false;
                  update();
                }
            );
          }
      );
    }else{

    }
  }


  Future<bool> _checkServerStatus() async{
    final String apiRoute = '${ApiConsole.bananaOpenUrl}/server/check';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try{
      await dio.post(apiRoute,);
      return true;
    } catch(_){
      _commonWidgets.customSnackbar('현재 서버 연결이 원활하지 않습니다.');
      return false;
    } finally {
      dio.close();
    }
  }


  void gotoEstimateView(DealStatusList currentDeal, int route) async{
    bool next = await _checkServerStatus();
    if(next == true){
        // route == 0 ?
        // await SrcDealController.to.getDealEstimate(SrcDealController.to.dealStatus.value.result[index].diIdx) : null;
        // await refreshListEnd(SrcDealController.to.dealStatus.value.result[index].diIdx);
        await DeviceManager.overLayClients();
        Get.to(() => EstimateView(
          diIdx: currentDeal.diIdx,
        ),
            arguments: currentDeal,
            binding: BindingsBuilder(() {
          Get.put(EstimatedController(
              currentDeal: currentDeal,
              commonWidgets: _commonWidgets,
              dealRepository: _dealRepository,
              srcDealRepository: _srcDealRepository,
              srcEstimateRepository: _srcEstimateRepository
          ));
        }));
        buttonClick.value = false;
        update();

    } else{
      _commonWidgets.customSnackbar('일시적인 오류로 서버와 연결이 끊겼습니다. 잠시 후 다시 시도해 주세요.');
      buttonClick.value = false;
      update();
    }
  }


  GestureTapCallback pageGo({
    required BuildContext context,
    required DealStatusList currentDeal, required int route,
    required bool isLoading,
  }) {
    return (){
     if(Get.isSnackbarOpen){
       Get.back();
     } else{
       if(!isLoading){
         if(!buttonClick.value){
           buttonClick.value = true;
           update();
           gotoEstimateView(currentDeal, route);
         }
       }
     }
    };
  }


  late ScrollController scrollController;

  RxList<DealStatusList> remoteList = <DealStatusList>[].obs;
  RxList<int> deleteList = <int>[].obs;
  RxInt selected = 1.obs;

  Future<void> deleteDealNoti() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('groupDealFront');
    await prefs.remove('groupDealBack');
    SrcNotiController.to.deleteNotiDeal();
  }


  Future<void> sendDelete() async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      if(deleteList.isEmpty){
        _commonWidgets.customSnackbar('삭제할 항목이 없어요.');
      } else{
        AuthBagicApi api = await LoadingController.to.apiLoadings(
           future:  _srcDealRepository.deleteDealEstimate(
               diIdx: deleteList.toString().replaceAll('[', "").replaceAll(']', "").replaceAll(RegExp('\\s'), "")
           ),
          text: Style.infoMent
        );
        if(api.status == 200){
          await clickRefresh(Get.context, false);
          await deleteDealNoti();
          initMangement();
          await setRemoteList();
          _commonWidgets.customSnackbar('리스트 삭제에 성공했어요');
          scrollController.hasClients ? scrollController.jumpTo(0.0) : null;
        }
      }
    }
  }

  Future<void> setRemoteList() async{
    int mIdx = SrcInfoController.to.infoM.value.mIdx;
    DealStatus dealAll = await _srcDealRepository.getDealStatusAll(mIdx: mIdx);
    remoteList.addAll(dealAll.result.where((element) => element.diStatus == '종료' || element.diStatus == '개통'));
    remoteList.toSet();
    update();
  }

  void clickManagement({
    required BuildContext context,
    required bool isBuild
  }) async{
    await setRemoteList();
    isBuild ? scrollController = ScrollController() : null;
    update();
    if(remoteList.isEmpty){
      _commonWidgets.customSnackbar('종료된 딜이 없습니다.');
    } else{
      Future.delayed(Duration.zero, (){
        showDialog<String>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) =>
                EndManagementDialog()
        );
      });
    }
  }

  void initMangement(){
    remoteList.clear();
    deleteList.clear();
    selected.value = 1;
    update();
  }

  void closeManagementDialog(){
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      initMangement();
      if(scrollController.hasClients){
        scrollController.dispose();
      }
      Get.back();
    }
  }

  void clickTotalButton(){
    selected.value == 1 ? selected.value = 0 : selected.value = 1;
    update();
    if(selected.value == 0 && deleteList.isEmpty)
    {
      for (int i = 0; i< remoteList.length; i++){
        deleteList.add(remoteList[i].diIdx);
        update();
      }
      deleteList.toSet();
      update();
    }
    if(selected.value == 0 && deleteList.isNotEmpty)
    {
      deleteList.clear();
      update();
      for (int i = 0; i< remoteList.length; i++){
        deleteList.add(remoteList[i].diIdx);
        update();
      }
      deleteList.toSet();
      update();
    }
    if(selected.value == 1) {
      deleteList.clear();
      update();
    }
  }

  void clickSingleManagement(int index){
    selected.value = 1;
    update();
    if(deleteList.contains(remoteList[index].diIdx))
    {
      deleteList.remove(remoteList[index].diIdx);
      update();
    }
    else{
      deleteList.add(remoteList[index].diIdx);
      update();
      if(remoteList.length == deleteList.length){
        selected.value = 0;
        update();
      }
      // if(controller.remoteList.length == controller.deleteList.length){
      //   controller.selected.value = 0;
      //   controller.deleteList.add(controller.remoteList[index].diIdx);
      // } else{
      //
      // }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


}