import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/socket_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/auth_basic_api.dart';
import 'package:banana_deal_by_monkeycompany/app/models/store/store_list_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_user_room_list.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/bottom_nav_bar/controllers/bd_bot_nav_chat_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_route_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/bdbot/bd_bot_nav_rapository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/deal/make_deal_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class InviteDealController extends GetxController {
  static InviteDealController get to => Get.find();

  final bool? isChat;
  final BdBotNavRepository _bdBotNavRepository;
  final MakeDealRepository _makeDealRepository;
  final CommonWidgets commonWidgets;
  final String storeId;
  final int diIdx;

  InviteDealController({
    required BdBotNavRepository bdBotNavRepository,
    required MakeDealRepository makeDealRepository,
    required this.isChat,
    required this.commonWidgets,
    required this.storeId,
    required this.diIdx,
  }) : _bdBotNavRepository = bdBotNavRepository,
       _makeDealRepository = makeDealRepository;


  final SocketManger _socketManger = SocketManger();

  RxBool allClick = false.obs;

  RxBool completed = false.obs;
  RxInt selected = 3.obs;
  RxList invitedList = [].obs;
  RxList deleteList = [].obs;
  RxBool isError = false.obs;
  RxList<Sinfo> addStore = <Sinfo>[].obs;
  RxList<Sinfo> storeList  = <Sinfo>[].obs;
  Rx<AuthBagicApi> result = AuthBagicApi(status: 0, msg: '', result: []).obs;
  late ScrollController sController;

  RxBool initStateNow = false.obs;


  void changeComplete(){
    completed.value = true;
    Get.back();
  }

  Future<bool> settingInitState() async{
      if(storeId != '')
      {
        await postStore(isChat);
        try{
          await BdBotNavChatController.to.notiUpdate();
        } catch(_){

        }
        completed.value = true;
        update();
        return false;
      }
      else{
        sController = ScrollController();
        await getStore();
        storeId != ''
            ? invitedList.add(storeId)
            : null;
        sController.addListener(() async{
          if(sController.position.maxScrollExtent == sController.position.pixels)
          {
            await checkStore(page: storePage.value+1);
            update();
          }
          update();
        });
        return true;
      }
  }


  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    bool inits = await settingInitState();
    initStateNow.value = inits;
    update();

  }


  Future<void> fetchAllInvite({
    required InviteStore data,
    required List<RoomList> roomList,
    required IO.Socket socket,
  }) async{
    try{
      if(roomList.isNotEmpty){
        List<Future<void>> futures =
        List.generate(data.result.length, (int index) => sendInvite(
          smMID: data.result[index].smMId,
          dIdx: data.result[index].dIdx, socket: socket,
          chatRoom: roomList,
        ));
        await Future.wait(futures);
      }
    } catch(_){

    }
  }


  Future<void> postStoreAll() async{
    if(storeList.isNotEmpty){
      watingSocket.value = 10;
      update();
      InviteStore data = await _makeDealRepository.postStoreListAllNew(
          diIdx: diIdx,
          mName: SrcInfoController.to.infoM.value.mName,
          del_sm_m_id: deleteList.isEmpty ? '' : deleteList.toString().replaceAll('[', "").replaceAll(']', "").replaceAll(RegExp('\\s'), "")
      );
      if(data.status == 200)
      {
        List<RoomList> roomList = await BdBotNavChatController.to.getRoomList(SrcInfoController.to.infoM.value.mIdx);
        final IO.Socket socketIo = await _socketManger.initSocket();
        await fetchAllInvite(data: data, socket: socketIo, roomList: roomList);
        _socketManger.socketDisconnect(socketIo);
        watingSocket.value = 20;
        update();
      }
      else{
        completed.value = false;
        isError.value = false;
        loading.value = false;
        watingSocket.value = 0;
        update();
      }
    }else{
      allClick.value = false;
      update();
    }

  }


  Future<void> postStore(bool? isChat) async {
    storeId == '' ? watingSocket.value = 10 : null;
    update();
    InviteStore data = await _makeDealRepository.postStoreListNew(
        diIdx: diIdx, smMid:
    storeId == '' ? invitedList.toString().replaceAll('[', "").replaceAll(']', "").replaceAll(RegExp('\\s'), "") : storeId
        ,mName: SrcInfoController.to.infoM.value.mName
    );
    // for(var i =0; i < 1000; i++){
    //   await _makeDealRepository.postStoreList(
    //       diIdx: MakeDealController.to.result.value.result[0], smIdx: invitedList.toString().replaceAll('[', "").replaceAll(']', "").replaceAll(RegExp('\\s'), "")
    //       ,mName: SrcInfoController.to.infoM.value.mName
    //   );
    // }

    if(data.status == 200)
    {
      List<RoomList> roomList = await BdBotNavChatController.to.getRoomList(SrcInfoController.to.infoM.value.mIdx);
      final IO.Socket socketIo = await _socketManger.initSocket();
      if(storeId != '') {
        try{
          await SrcDealController.to.outUpdateInvite(diIdx: diIdx);
          await sendInvite(
            smMID: data.result.first.smMId,
            dIdx: data.result.first.dIdx, socket: socketIo, chatRoom: roomList, );
        } catch(_){
          try{
            await sendInvite(
              smMID: data.result.first.smMId,
              dIdx: data.result.first.dIdx, socket: socketIo, chatRoom: roomList,);
          } catch(_){

          }
        }
        completed.value = true;
      }
      else {
        await fetchAllInvite(data: data, socket: socketIo, roomList: roomList);
        watingSocket.value = 20;
        update();
      }
      _socketManger.socketDisconnect(socketIo);
    }
    else{
      completed.value = false;
      isError.value = false;
      loading.value = false;
      watingSocket.value = 0;
      update();
    }

  }

  void gotoDetail({
    required String smid,
  }){
    SrcRouteController.to.gotoStoreDetail(
        isInvite: true,
        smid: smid, midx: SrcInfoController.to.infoM.value.mIdx, index1: null, rong: null);
  }

  Future<void> failError() async{
    await getStore();
  }


  RxBool storeListLast = false.obs;
  RxInt storePage = 0.obs;
  RxBool loading = false.obs;
  
// TODO: check 수정해야 됨

  Future<void> getStore() async{
    storePage.value = 0;
    storeListLast.value = false;
    isError.value = false;
    update();
    StoreListInfo store = await _bdBotNavRepository.getStoreListInvite(start: 0, diIdx: diIdx);
    if(store.status == 200){
      storeList.value = store.result;
      storeListLast.value = false;
      update();

    }
    else{
      storeList.value = store.result;
      storeListLast.value = false;
      update();
      if(store.status >= 500){
        isError.value = true;
      }
    }


  }


  Future<void> getAddStore({required int page}) async{
    if(storePage.value != 0){
      StoreListInfo store = await _bdBotNavRepository.getStoreListInvite(start: 20*page, diIdx: diIdx);
      if(store.status == 200){
        isError.value = false;
        addStore.value = store.result;
        storeList.addAll(addStore);
        loading.value = false;
        watingSocket.value = 0;
        update();
      }
      else{
        loading.value = false;
        watingSocket.value = 0;
        update();
        if(store.status >= 500){
          isError.value = true;
          update();
        }
      }
    }
  }


  Future<void> checkStore({required int page}) async{
    loading.value = true;
    isError.value = false;
    update();
    if(!storeListLast.value){
      StoreListInfo store = await _bdBotNavRepository.getStoreListInvite(start: 20*page, diIdx: diIdx);
      if(store.status == 200){

        storePage.value++;
        update();
      }
      else{
        commonWidgets.customSnackbarBottom(AppElement.storeLastListMent);
        storeListLast.value = true;
        loading.value = false;
        watingSocket.value = 0;
        update();
        if(store.status >= 500){
          isError.value = true;
          update();
        }
      }
    } else{
      loading.value = false;
      watingSocket.value = 0;
      update();
    }
  }


  RxBool sendMessage = false.obs;
  RxInt watingSocket = 0.obs;

  Future<void> sendInvite({
    required IO.Socket socket,
    required int dIdx,
    required List<RoomList> chatRoom,
    required String smMID}) async{
    if(chatRoom.where((e) => e.crStatus == 'NORMAL' && e.smMId == smMID).isNotEmpty){
      if(storeId != '' && isChat != null){
        try{
          ChatLogController.to.sendDeal(dIdx: dIdx);
          await ChatLogController.to.refreshRoomInfo();
        } catch(_){

        }
        sendMessage.value = true;
        commonWidgets.customSnackbar('초대장을 보냈어요.');
        update();

      }
      else{
        final RoomList room = chatRoom.firstWhere((e) => e.crStatus == 'NORMAL' && e.smMId == smMID);
        await _socketManger.joinRoom(
            socket: socket,
            mName: SrcInfoController.to.infoM.value.mName,
            socketEnum: SocketEnum.invite, room: room, dIdx: dIdx);
        await _socketManger.codeLeave(crIdx: '${room.crIdx}', socket: socket, isMulti: true);
        sendMessage.value = false;
        update();
        try{
          if(StoreDetailController.to.initialized){
            await StoreDetailController.to.reloadDetail();
          }
        }catch(_){

        }
      }

    }else{
      sendMessage.value = false;
      update();
    }
  }


  void clickAllButton({required int index}){
    selected.value = index;
    if(index == 0){
      invitedList.clear();
      deleteList.clear();
      allClick.value = true;
    }
    if(index == 1) {
      invitedList.clear();
      deleteList.clear();
      allClick.value = false;
      Timer(const Duration(milliseconds: 200),
              (){
            selected.value = 2;
          }
      );
    }
    update();
  }

  // void selectedBoxClick({required int index}){
  //   selected.value = index;
  //   if(index == 0 && invitedList.isEmpty)
  //   {
  //     for (int i = 0; i<storeList.length; i++){
  //       invitedList.add(storeList[i].smMId);
  //     }
  //     invitedList.toSet();
  //   }
  //   if(index == 0 && invitedList.isNotEmpty)
  //   {
  //     invitedList.clear();
  //     for (int i = 0; i<storeList.length; i++){
  //       invitedList.add(storeList[i].smMId);
  //     }
  //     invitedList.toSet();
  //   }
  //   if(index == 1) {
  //     invitedList.clear();
  //     Timer(const Duration(milliseconds: 200),
  //             (){
  //           selected.value = 2;
  //         }
  //     );
  //   }
  //   update();
  // }

  void selectedBoxLongClick(){
    selected.value = 3;
    invitedList.clear();
    update();
  }

  void listClickEvent(int index){
   if(allClick.value){
     invitedList.clear();
     if(deleteList.contains(storeList[index].smMId)){
       deleteList.remove(storeList[index].smMId);
       selected.value = 3;
       update();
     } else{
       deleteList.add(storeList[index].smMId);
       selected.value = 3;
       update();
     }
     update();
   }else{
     deleteList.clear();
     if(invitedList.contains(storeList[index].smMId)){
       invitedList.remove(storeList[index].smMId);
       selected.value = 3;
       update();
     }
     else{
       invitedList.add(storeList[index].smMId);
       selected.value = 3;
       update();
     }
   }
  }

  Future<void> clickCompleted() async{
    if(!Get.isSnackbarOpen) {
      await SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx);
      Get.back();
    } else{
      Get.back();

    }
  }

  void _controllerClose(){
    sController.dispose();
  }


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debounce(watingSocket, (_) async{
      if(watingSocket.value == 20){
        watingSocket.value = 0;
        completed.value = true;
        commonWidgets.customSnackbar('초대장을 보냈어요.');
        update();
      }
    });
    debounce(storePage, (_) async{
      if(storePage.value != 0){
        await getAddStore(page: storePage.value);
        update();
      }
    });
  }

  @override
  void dispose() async{
    // TODO: implement dispose
    _controllerClose();
    super.dispose();
  }


}