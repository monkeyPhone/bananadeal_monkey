import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/managers/image/image_dialog_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_user_room_list.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../../components/common_widgets.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../main/auth/auth_controller.dart';
import '../../widgets/service/service_model/chat_cache.dart';
import '../../widgets/service/service_model/chat_user_chat_list.dart';
import '../../../../../repository/chat/chat_service_repository.dart';
import '../../widgets/service/service_moduels/views/widgets/declaration_chat/chat_declaration_dialog.dart';


class ChatController extends GetxController {

  static ChatController get to => Get.find();

  final ChatServiceRepository _chatServiceRepository;
  final CommonWidgets _commonWidgets;
  final ImageDialogManager imageDialogManager;
  ChatController({
    required ChatServiceRepository chatServiceRepository,
    required CommonWidgets commonWidgets,
    required this.imageDialogManager,
  }) : _chatServiceRepository = chatServiceRepository,
        _commonWidgets = commonWidgets;


  RxInt openDialog = 0.obs;
  RxInt openLoading = 0.obs;

  RxList<RoomList> declaList = <RoomList>[].obs;

  RxList<ChatLogList> log = <ChatLogList>[].obs;
  RxList<ChatLogList> addLog = <ChatLogList>[].obs;
  RxList<ChatLogList> showLog = <ChatLogList>[].obs;
  RxInt  pageNation = 0.obs;
  RxBool chatLoading = false.obs;

  void initLogValue(){
    addLog.clear();
    update();
  }


  void changeChatDeclaration(List<RoomList> declaValue){
    declaList.clear();
    openDialog.value = 3;
    declaList.addAll(declaValue);
    Get.back();
  }


  void changeOpenLoading(int index){
    openLoading.value = index;
  }

  void roomClick({required int roomIdx, required bool isChatList}) async{
    if(isChatList){
      if(openLoading.value != 3 && openDialog.value == 0 && !chatLoading.value){
        chatLoading.value = true;
        update();
        if(roomIdx == 0)
        {

        }
        else{
          await getLog(roomIdx);
        }
        chatLoading.value = false;
        update();
      }
    }
    else{
      await getLog(roomIdx);
    }
    // if(Get.isSnackbarOpen == true){
    //
    // }else{
    //   currentRoomIdx.value = 0;
    //   if(roomIdx == 0)
    //   {
    //
    //   }
    //   else{
    //     await getLog(roomIdx);
    //   }
    //   update();
    // }
  }

  Future<void> getLog(int roomIdx) async{
    try{
      ChatUserRoomList userRoom = await _chatServiceRepository.getRoomByIdx(crIdx: roomIdx);

      if(roomIdx == 0)
      {
        _commonWidgets.customSnackbar('룸 아이디엑스가 정확하지 않습니다.');
      }
      else{
        await logTry(room: userRoom.result.first);
      }
    }catch(_){
      _commonWidgets.customSnackbar('채팅방 갱신 실패');
    }
  }

  Future<void> logTry({required RoomList room}) async{
    log.clear();
    update();
    try {
      if (AuthController.to
          .restoreModel(room.crIdx.toString())
          .data
          .isEmpty) {
        ChatUserChatList data = await _chatServiceRepository.getChatList(
            crMidx: '${room.crIdx}',
            cLimit: '${0}');
        if (data.status == 200) {
          if(data.msg == '채팅 없음'){
            gotoLog(room.crIdx);
          }
          else{
            AuthController.to.chatCacheModel(
                room.crIdx.toString(),
                ChatCache(
                    data: data.result
                )
            );
            log.value = AuthController.to
                .restoreModel(room.crIdx.toString())
                .data;
            update();
            gotoLog(room.crIdx);
          }
        }
        else {
          log.value = <ChatLogList>[];
          update();
          gotoLog(room.crIdx);
        }
      }
      else {

        if (room
            .cIsRead != 0) {
          log.value = AuthController.to
              .restoreModel(room.crIdx.toString())
              .data;

          ChatUserChatList data = await _chatServiceRepository.getChatList(
              crMidx: '${room.crIdx}',
              cLimit: '${AuthController.to
                  .restoreModel(room.crIdx.toString())
                  .data
                  .length}');
          parseLog(data);
          update();
          // for (var i = 0; i < data.result.length; i++) {
          //   log.insert(AuthController.to
          //       .restoreModel(roomIdx.toString())
          //       .data
          //       .length,
          //       ChatLogList(cIdx: data.result[i].cIdx,
          //           cRoomIdx: data.result[i].cRoomIdx,
          //           cMessage: data.result[i].cMessage,
          //           cType: data.result[i].cType,
          //           cIsRead: 'N',
          //           cRegdate: data.result[i].cRegdate));
          // }
          // update();
          gotoLog(room.crIdx);
        }
        else {
          log.value = AuthController.to
              .restoreModel(room.crIdx.toString())
              .data;
          if (log.last.cMessage != room
              .lastMessage) {
            AuthController.to.deleteChat(room.crIdx.toString());
            ChatUserChatList data = await _chatServiceRepository.getChatList(
                crMidx: '${room.crIdx}',
                cLimit: '${AuthController.to
                    .restoreModel(room.crIdx.toString())
                    .data
                    .length}');
            parseLog(data);
            update();
            // for (var i = 0; i < data.result.length; i++) {
            //   log.insert(AuthController.to
            //       .restoreModel(roomIdx.toString())
            //       .data
            //       .length,
            //       ChatLogList(cIdx: data.result[i].cIdx,
            //           cRoomIdx: data.result[i].cRoomIdx,
            //           cMessage: data.result[i].cMessage,
            //           cType: data.result[i].cType,
            //           cIsRead: 'N',
            //           cRegdate: data.result[i].cRegdate));
            // }
            // update();
            gotoLog(room.crIdx);
          }
          else {
            gotoLog(room.crIdx);
          }
        }
      }
    }catch(e){
      AuthController.to.deleteChat(room.crIdx.toString().toString());
      ChatUserChatList data = await _chatServiceRepository.getChatList(
          crMidx: '${room.crIdx}',
          cLimit: '${0}');
      if(data.status == 200)
      {
        AuthController.to.chatCacheModel(room.crIdx.toString(), ChatCache(data: data.result));
        log.value = AuthController.to.restoreModel(room.crIdx.toString()).data;
        update();
        if (kDebugMode) {
          print('this chat route is initial and all restore chat list');
        }
        gotoLog(room.crIdx);
      }
      else{
        if (kDebugMode) {
          print('out out out');
        }
        log.value = <ChatLogList>[];
        update();
        gotoLog(room.crIdx);
      }
    }
    // chatLogInitSort();
  }


  void gotoLog(int crIdx){
    initLogValue();
    try{
      if(ChatLogController.to.initialized){
        addShowLog();
      } else {
        deleteShowLog();
        getShowLog();
        Get.toNamed(Routes.CHATING, parameters: {'crIdx': '$crIdx'});
      }
    } catch(_){
      deleteShowLog();
      getShowLog();
      Get.toNamed(Routes.CHATING, parameters: {'crIdx': '$crIdx'});
    }
  }

  void deleteShowLog(){
    showLog.clear();
    update();
  }

  void getShowLog(){
    if(showLog.isEmpty){
      if(log.isNotEmpty){
        int startIndex = log.length > 100 ? log.length - 100 : 0;
        showLog.value = log.sublist(startIndex);
        update();
      }
    }
  }

  void parseLog(ChatUserChatList data){
    List<ChatLogList> delay = [];

    for (var i = 0; i < data.result.length; i++) {
      delay.add(
          ChatLogList(cIdx: data.result[i].cIdx,
              cRoomIdx: data.result[i].cRoomIdx,
              cMessage: data.result[i].cMessage,
              cType: data.result[i].cType,
              cIsRead: 'N',
              cRegdate: data.result[i].cRegdate)
          );
    }
    log.insertAll(
        log.isEmpty
            ? 0
            : log.length,
        delay
    );
    update();
  }

  void addShowLog(){
    int startIndex = log.length > 100 ? log.length - 100 : 0;
    List<ChatLogList> etcCht = log
        .sublist(startIndex).reversed
        .where((e) => e.cIsRead == 'N'&& e.cType == 'STORE')
        .map((e) =>   ChatLogList(
      cIdx: e.cIdx,
      cRoomIdx: e.cRoomIdx,
      cMessage: e.cMessage,
      cType: e.cType,
      cIsRead: e.cIsRead,
      cRegdate: e.cRegdate,
    )).toList();
    if(etcCht.isNotEmpty){
      showLog.insertAll(
          showLog.isEmpty
              ? 0
              : showLog.length,
          etcCht.reversed.toList()
      );
      update();
      // showLog.insert(etcCht);
    }

  }

  void addShowLogOuter(List<ChatLogList> insert){
    showLog.insertAll(
        showLog.isEmpty
            ? 0
            : showLog.length,
        insert
    );
    update();
    addLog.insertAll(
        addLog.isEmpty
            ? 0
            : addLog.length,
        insert
    );
    update();
  }



  void loadMoreItems() {
    int totalMessages = log.length;
    int currentlyLoaded = showLog.length;
    int remainingMessages = totalMessages - currentlyLoaded;

    if (remainingMessages > 0) {
      int messagesToLoad = remainingMessages < 100 ? remainingMessages : 100;
      int startIndex = totalMessages - currentlyLoaded - messagesToLoad;
      int endIndex = totalMessages - currentlyLoaded;
      List<ChatLogList> newMessages = log.sublist(startIndex, endIndex);
      showLog.insertAll(0, newMessages);
      update();
    }
    // int remainingItems = log.length - showLog.length;
    // if (remainingItems > 0) {
    //   int itemsToLoad = remainingItems > 100 ? 100 : remainingItems;
    //   int startIndex = log.length - showLog.length - itemsToLoad;
    //   List<ChatLogList> newItems = log.sublist(startIndex, startIndex + itemsToLoad);
    //   showLog.addAll(newItems);
    // }

  }



  void insertChatLog({
        required int cRoomIdx, required String cMessage, required String cType, required String cIsRead, required String cRegdate
    })
  {
    addLog.insert(
        addLog.isEmpty
            ? 0
            : addLog.length,
        ChatLogList(
          cIdx: log.isEmpty
                  ? 0
                  : log.last.cIdx+1,
          cRoomIdx: cRoomIdx,
          cMessage: cMessage,
          cType: cType,
          cIsRead: cIsRead,
          cRegdate: cRegdate,
        )
    );
    update();
    showLog.insert(
        showLog.isEmpty
            ? 0
            : showLog.length,
        ChatLogList(
          cIdx: log.isEmpty
              ? 0
              : log.last.cIdx+1,
          cRoomIdx: cRoomIdx,
          cMessage: cMessage,
          cType: cType,
          cIsRead: cIsRead,
          cRegdate: cRegdate,
        )
    );
    update();
  }



  void getChatList(int crIdx){
    for( var i=0; i< log.length; i++ ){
      log[i].cIsRead = 'Y';
    }
    for( var i=0; i< addLog.length; i++ ){
      addLog[i].cIsRead = 'Y';
    }
    for( var i=0; i< showLog.length; i++ ){
      showLog[i].cIsRead = 'Y';
    }
    log.addAll(addLog);
    addLog.clear();
    update();
    AuthController.to.chatCacheModel(crIdx.toString(), ChatCache(data: log));
    update();
  }

  // void chatLogInitSort(){
  //   log.sort(
  //           (a,b)=> DateTime.parse(a.cRegdate).compareTo(DateTime.parse(b.cRegdate))
  //   );
  //   update();
  // }


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    debounce(openDialog, (_) {
      if(openDialog.value == 3){
        Timer(
          Duration(seconds: 1),
            (){
              ChatDeclarationDialog().openDeclarationDialog(Get.context!);
              openDialog.value = 0;
            }
        );
      }
    });
  }


}