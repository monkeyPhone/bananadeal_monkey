import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../managers/device_manager.dart';
import '../../../../../models/rank/rank_list.dart';
import '../../../../../routes/api_url.dart';
import '../../../src_components/controllers/src_info_controller.dart';
import '../../../src_components/controllers/src_rank_controller.dart';
import '../../../src_components/controllers/src_route_controller.dart';
import '../../deal/controllers/search_phone_controllers/search_phone_detail_controller.dart';
import '../../deal/views/pages/search_phone/search_phone_detail.dart';

class RankPhoneController extends GetxController{

  final CommonWidgets _commonWidgets;

  RankPhoneController({
    required CommonWidgets commonWidgets
  }) : _commonWidgets = commonWidgets;

  late final ScrollController firstController;
  late final ScrollController allController;

  RxList content = ['전체', '프리미엄형', '고급형', '보급형', '실속형'].obs;
  RxList phone = ['아이폰 13Pro 512G'].obs;
  RxInt currentTap = 0.obs;

  RxBool error = false.obs;

  RxInt button = 30.obs;


  RxList<Rankinfo> currentRank = <Rankinfo>[].obs;

  void getCurrentRank(){
    currentRank.clear();
    switch(currentTap.value){
      case 0:
        currentRank.addAll(SrcRankController.to.totalInfo);
        update();
        break;
      case 1:
        currentRank.addAll(SrcRankController.to.premiumInfo);
        update();
        break;
      case 2:
        currentRank.addAll(SrcRankController.to.highInfo);
        update();
        break;
      case 3:
        currentRank.addAll(SrcRankController.to.normalInfo);
        update();
        break;
      case 4:
        currentRank.addAll(SrcRankController.to.worthyInfo);
        update();
        break;
    }
  }


  Future<void> funcCall(int index) async{
    currentRank.clear();
    List<Rankinfo> list = await SrcRankController.to.getRankGrade(index);
    if(list.isNotEmpty){
      currentRank.addAll(list);
      update();
    } else{
      error.value = true;
      update();
    }
  }

  Future<List<Rankinfo>> getRank(int index) async{
    switch (index){
      case 0:
        getCurrentRank();
        break;
      case 1:
        if(SrcRankController.to.premiumInfo.isEmpty){
          await funcCall(index);
        } else{
          getCurrentRank();
        }
        break;
      case 2:
        if(SrcRankController.to.highInfo.isEmpty){
          await funcCall(index);
        } else{
          getCurrentRank();
        }

        break;
      case 3:
        if(SrcRankController.to.normalInfo.isEmpty){
          await funcCall(index);
        } else{
          getCurrentRank();
        }

        break;
      case 4:
        if(SrcRankController.to.worthyInfo.isEmpty){
          await funcCall(index);
        } else{
          getCurrentRank();
        }

        break;
    }

    return currentRank;
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    firstController = ScrollController();
    allController = ScrollController();
    currentRank.clear();
    currentRank.addAll(SrcRankController.to.totalInfo);
    update();
  }

  void tapClick(int index){
    error.value = false;
    currentTap.value = index;
    if(allController.hasClients){
      allController.jumpTo(0.0);
    }
    getCurrentRank();
    update();
  }

  void searchClick(int index, List<Rankinfo> rank) async{
    final bool connect = await ApiConsole().getInternetStatus();
    if(connect){
      button.value = index;
      update();
      Timer(const Duration(milliseconds: 200),
              () async{
              await DeviceManager.overLayClients();
            Get.to(
                    () => SearchPhoneDetail(
                  psIdex: rank[index].psIdx,
                  psName: rank[index].psName,
                ), binding: BindingsBuilder(() {
              Get.put(SearchPhoneDetailController());
            })
            );
            Timer(
                const Duration(milliseconds: 200),
                    (){
                  button.value = 30;
                  update();
                }
            );

          }
      );
    } else{
      _commonWidgets.customSnackbar('인터넷 연결상태를 확인해주세요.');
    }

  }

  GestureTapCallback inkwellClick({
    required BuildContext context,
    required String phoneName, required int phoneIdx, required String phoneModel, required String phoneImg}){
    return SrcInfoController.to.infoM.value.mLatitude == '' || SrcInfoController.to.infoM.value.mLongitude == ''
        ?
        (){
      SrcRouteController.to.initSetting(context);
    }
        :
        () async{
      if(Get.isSnackbarOpen){
        Get.back();
      } else{
        await SrcRouteController.to.rankDeal(
          context: context,
            phoneName: phoneName,
          phoneIdx: phoneIdx,
          phoneModel: phoneModel,
          phoneImg: phoneImg
        );
      }
    };
  }

  void _controllerClose(){
    allController.dispose();
    firstController.dispose();
  }



  @override
  void onClose() {
    // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }


}