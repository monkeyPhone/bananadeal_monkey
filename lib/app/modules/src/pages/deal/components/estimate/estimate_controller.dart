import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_routing.dart';
import 'package:banana_deal_by_monkeycompany/app/components/future_loading_overlay.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/fcm/dialog/fcm_dialog.dart';
import 'package:banana_deal_by_monkeycompany/app/models/src/deal/estimate_status.dart';
import 'package:banana_deal_by_monkeycompany/app/models/src/deal/user_deal.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/widgets/etimate_detail_dialog.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_user_room_list.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/estimate/estimate_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../components/common_widgets.dart';
import '../../../../../../managers/socket_manager.dart';
import '../../../../../../models/auth_basic_api.dart';
import '../../../../../../models/nav/deal/deal_estimate.dart';
import '../../../../../../models/nav/deal/deal_status.dart';
import '../../../../../../repository/deal/deal_repository.dart';
import '../../../../../../repository/src/src_deal_repository.dart';
import '../../../../../../routes/const/const_info.dart';
import '../../../../src_components/controllers/src_deal_controller.dart';
import '../../../../src_components/controllers/src_info_controller.dart';
import '../../../widgets/service/chat_service_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;



class EstimatedController extends GetxController {

  static EstimatedController get to => Get.find();
  final SrcEstimateRepository _srcEstimateRepository;
  final DealRepository _dealRepository;
  final SrcDealRepository _srcDealRepository;
  final CommonWidgets _commonWidgets;
  final SocketManger _socketManger = SocketManger();
  final DealStatusList currentDeal;

  EstimatedController({
    required SrcEstimateRepository srcEstimateRepository,
    required DealRepository dealRepository,
    required SrcDealRepository srcDealRepository,
    required CommonWidgets commonWidgets,
    required this.currentDeal,
  }) :  _srcEstimateRepository = srcEstimateRepository,
        _dealRepository = dealRepository,
        _srcDealRepository = srcDealRepository,
        _commonWidgets = commonWidgets;

  late ScrollController scrollController;

  RxString estimateStatus = ''.obs;
  RxList<DealEstimateList> estimateList = <DealEstimateList>[].obs;
  RxInt currentPage = 0.obs;
  RxInt currentSort = 0.obs;

  RxBool isUpdate = true.obs;
  RxInt dealReg = 10.obs;

  RxInt change = 0.obs;
  RxBool isError = false.obs;


  void changeBool(bool re){
    refreshClick.value = re;
    update();
  }

  Future<void> gotoDetail({
    required BuildContext context,
    required int diIdx
  }) async{
    UserDeal deal = await _srcDealRepository.getDealInfoNew(diIdx: diIdx);
    if(context.mounted){
      if(deal.status == 200){
        AppOutsRouting().showDetailBottomSheet(context: context, userDealInfo: deal.result.first);
      }
    }
  }


  void initDataFail(){
    estimateList.clear();
    currentPage.value = 0;
    currentSort.value = 0;
    isError.value = true;
    isUpdate.value = true;
    update();
  }

  void initData(){
    currentPage.value = 0;
    currentSort.value = 0;
    isError.value = false;
    isUpdate.value = true;
    if(scrollController.hasClients){
      scrollController.jumpTo(0.0);
    }

    update();
  }

  Future<void> getEstimateStatus() async{
  final EstimateStatus estStatus = await _srcEstimateRepository.getDealEstimateByIdxStatus(currentDeal.diIdx);
  estimateStatus.value = estStatus.result.first.dStatus;
  update();
}

Rx<bool> isLoading = false.obs;

  Future<void> initEstimateList() async{
    DateTime dateTime1 = DateTimeConfig().now;
    DateTime dateTime2 =DateTime.parse(currentDeal.diRegdate).toLocal();
    Duration duration = dateTime1.difference(dateTime2);
    durations.value = duration;
    update();

    final DealEstimate estimate = await _srcEstimateRepository.getDealEstimate(
        diIdx: currentDeal.diIdx,
        start: currentPage.value*20,
        order: currentSort.value,
        length: 20);
    if(estimate.status == 200){
      estimateList.value = estimate.result;
      update();
      if(estimate.result.isNotEmpty)
      {
        currentPage.value = currentPage.value+1;
        isUpdate.value = true;
        update();
      }
      else{
        isUpdate.value = false;
        update();
      }
    }
    else{
      initDataFail();
    }
    isLoading.value = false;
    update();
  }



  Future<void> addEstimateList() async{
    final DealEstimate estimate = await _srcEstimateRepository.getDealEstimate(
        diIdx: currentDeal.diIdx,
        start: currentPage.value*20,
        order: currentSort.value,
        length: 20);
    if(estimate.status == 200){
      estimateList.addAll(estimate.result);
      update();
      if(estimate.result.isNotEmpty)
      {
        currentPage.value = currentPage.value+1;
        isUpdate.value = true;
        update();
      }
      else{
        isUpdate.value = false;
        update();
      }
    }
    else{
      initDataFail();
    }

  }



  Future<void> refreshButton() async{
    initData();
    await getEstimateStatus();
    await initEstimateList();
    await SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx.toInt());
  }

  Future<void> clickSortButton(int index) async{
    if(scrollController.hasClients){
      scrollController.jumpTo(0.0);
    }
    currentPage.value = 0;
    currentSort.value = index;
    update();
    await initEstimateList();
  }


  Future<AuthBagicApi> sendReservation({
    required DealEstimateList estimate,
    required BuildContext context,
    required String smName
    }) async{
    if(Get.isSnackbarOpen){
      Get.back();
      return AuthBagicApi(status: 0, msg: '', result: []);
    } else{
      change.value = 10;
      if(estimate.dStatus != 'ACCEPT' && estimate.dStatus == 'PARTICIPATE'){
        final AuthBagicApi confirm = await _srcDealRepository.sendConfirmDeal(
            deDidx: estimate.deDIdx,
            dDiIdx: estimate.deDiIdx,
            mName: SrcInfoController.to.infoM.value.mName,
            smMid: estimate.deSmMId,
            mIdx: SrcInfoController.to.infoM.value.mIdx
        );

        if(confirm.status == 200){
          await SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx.toInt());
          await Future.delayed(Duration(milliseconds: 200));
          // await DealController.to.refreshListEnd(SrcDealController.to.dealStatus.value.result[0].diIdx);
          await refreshButton();
          try{
            await joinRoom(smMID: estimate.deSmMId, dIdx: estimate.deDIdx, smName: estimate.smStoreName);
          } catch(_){
           try{
             await joinRoom(smMID: estimate.deSmMId, dIdx: estimate.deDIdx, smName: estimate.smStoreName);
           } catch(_){

           }
          }
        } else{
          if(confirm.status == 402){
            _commonWidgets.customDialogButton1(
                routerContext: context,
                onTap: (){
                  Get.back();
                }, mainText: confirm.msg, buttonText: '확인');
          }
        }
        return confirm;
      } else{
        _commonWidgets.customSnackbar('이미 수락된 딜이에요');
        change.value = 0;
        return AuthBagicApi(status: 0, msg: '', result: []);
      }
    }
  }


  @override
  void onInit() async{
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels && isUpdate.value) {
        await addEstimateList();
      }
    });
    initData();
    isLoading.value = true;
    update();
    await getEstimateStatus();
    await initEstimateList();
    isLoading.value = false;
    update();

  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();


    ever(dealReg, (_) async{
      await endDeal(
        diHopePhone: currentDeal.diHopePhone,
        diIdx: currentDeal.diIdx
      );
    }
    );
  }



  Future<void> clickEndButton({
    required BuildContext context,
    required String diHopePhone,
    required int diIdx,
  }) async{
    if(Get.isSnackbarOpen){
      Get.back();
    }else{
      _commonWidgets.customDialog(
          routerContext: context,
          mainText: '딜을 종료하시면,\n 더 이상 견적을 받을 수 없습니다. \n\n딜을 종료하시겠습니까?',
          confirmText: '종료', cancleText: '취소',
          conFirmOnTap: () async{
            Get.back();
            await endDeal(
              diIdx: diIdx,
              diHopePhone: diHopePhone
            );
          }
          );
    }
  }


  RxBool refreshClick = false.obs;
  RxBool sendMessage = false.obs;

  Rx<Duration> durations = Duration().obs;


  List convertValue(String value) {
    return value.split(',');
  }

  Future<void> endDeal({
    required String diHopePhone,
    required int diIdx,
  }) async{
    AuthBagicApi end = await _dealRepository.postEndDeal(diHopePhone: diHopePhone, uuid: SrcInfoController.to.infoM.value.mUuid, diIdx: diIdx);
    if(end.status == 200)
      {
        await showFutureLoadingOverlay(
            context: Get.context!,
            expanded: true,
            future: SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx.toInt()
          )
        );
        Get.back();
        Get.back();
        FcmDialog().customSnackbarPush(
          onTap: () async{
            Get.back();
          },
          alert: '',
          duration: 15,
          title: '종료 알림',
          text: '딜을 종료하여,\n더 이상 견적을 받을 수 없습니다.\n새로운 딜을 만들어 재 요청해보세요.',
          url: AppElement.dealEnd,
        );
      }
    else{
     if(end.status == 404){
       _commonWidgets.customSnackbar('이미 수락한 딜이 있어요.\n새로운 딜을 만들어 재 요청해보세요.');
     }
    }
  }

  Future<void> joinRoom({
    required String smMID,
    required int dIdx,
    required String smName
  }) async{
     final RoomList chatRoom = await SocketRepository().getRoomByIdxSMid(
         mIdx: SrcInfoController.to.infoM.value.mIdx,
         smId: smMID, storeName: smName
     );

     final IO.Socket socketIo = await _socketManger.initSocket();

     bool result = await _socketManger.joinRoom(
       socket: socketIo,
       mName: SrcInfoController.to.infoM.value.mName,
       socketEnum: SocketEnum.accept,
       dIdx: dIdx,
       room: chatRoom,
     );
       if (!result) {
         await Future.delayed(Duration(milliseconds: 200));
         await _socketManger.joinRoom(
           socket: socketIo,
           mName: SrcInfoController.to.infoM.value.mName,
           socketEnum: SocketEnum.accept,
           dIdx: dIdx,
           room: chatRoom,
         );// 잠시 대기 후 재시도
       }
     chatRoom.crIdx == -1
     ? null
     : await _socketManger.codeLeave(crIdx: '${chatRoom.crIdx}', socket: socketIo, isMulti: false);
  }

  void clickEstimateDetailButton({required DealEstimateList estimate,}){
    estimateStatus.value == InfoString.dealStatusIng
        ?
    OpenDialog.openDialog(
      routerContext: Get.context!,
      estimate: estimate,
      currentDeal: currentDeal
    )
        :
    OpenDialog.openDialog(
        routerContext: Get.context!,
        currentDeal: currentDeal,
        estimate: estimate, ro: true);
  }


 // Future<void> disconnectSocket() async{
 //   await _socketManger.socketDisconnect();
 // }



  Future<void> clickChatCunsulting({required String crSmid, required String storeName, required BuildContext context}) async{
     Timer(Duration(microseconds: 200),(){
      ChatServiceController.to.createChat2(crSmid: crSmid, context: Get.context, smName: storeName, message: '');
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

}