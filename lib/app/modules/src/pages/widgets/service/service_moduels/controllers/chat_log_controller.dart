import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/managers/device_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/main/auth/auth_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_error.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_user_chat_list.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_user_room_list.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/bottom_nav_bar/controllers/bd_bot_nav_chat_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_estimate_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const/const_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../../../../../components/common_widgets.dart';
import '../../../../../../../models/auth_basic_api.dart';
import '../../../../../../../models/nav/deal/deal_estimate.dart';
import '../../../../../../../repository/src/src_deal_repository.dart';
import '../../../../../../error/network_dialog/error_controller.dart';
import '../../../../../../error/network_dialog/error_dialog.dart';
import '../../../../../src_components/controllers/src_deal_controller.dart';
import '../../../../../src_components/controllers/src_info_controller.dart';
import '../../../../../src_components/controllers/src_route_controller.dart';
import '../../../../../../../repository/deal/make_deal_repository.dart';
import '../../../../chat/controllers/chat_controller.dart';
import '../../../../../../../repository/chat/chat_service_repository.dart';

/*
TODO: // 변경점 leave 안시키고 있음.
*/
class ChatLogController extends GetxController{
  static ChatLogController get to => Get.find();
  final ChatServiceRepository _chatServiceRepository;
  final MakeDealRepository _makeDealRepository;
  final SrcDealRepository _srcDealRepository;
  final CommonWidgets _commonWidgets;

  // = const RegisterManager().getChatServiceRepository()
  // = const RegisterManager().getMakeDealRepository()
  // = const RegisterManager().getSrcDealRepository()
  ChatLogController({
    required ChatServiceRepository chatServiceRepository,
    required MakeDealRepository makeDealRepository,
    required SrcDealRepository srcDealRepository,
    required CommonWidgets commonWidgets,
  }) :  _chatServiceRepository = chatServiceRepository,
        _makeDealRepository = makeDealRepository,
        _srcDealRepository = srcDealRepository,
        _commonWidgets = commonWidgets;


  RxList<Map<String, String>> logError = <Map<String, String>>[].obs;
  RxBool loading = false.obs;
  RxBool errorLoading = false.obs;
  Rx<ChatError> errorMessage = ChatError(cCase: '', cRoomIdx: '', cMessage: '', cType: '', token: '', cName: '',).obs;
  RxBool isTop = false.obs;
  RxBool isHidden = false.obs;
  RxBool menuClick = false.obs;
  RxString idx = ''.obs;
  RxString hiddenText = ''.obs;
  late FocusNode focus;
  late TextEditingController messageController;
  RxList<ChatLogList> saveLog = <ChatLogList>[].obs;
  RxList<DealEstimateList> estimateList = <DealEstimateList>[].obs;
  Rx<RoomList> roomInfo = RoomList(
      crIdx: 0, smMId: '', smIsShow: '', crStatus: '',
      smStoreName: '', smTel: '', smAddress: '',
      smPathImg0: '', lastMessage: '',
      lastMessageTime: '', cIsRead: 0,
      isDealing: 0, smToken: '',
      smLatitude: '',
      smLongitude: ''
  ).obs;


  // TODO:// Detail 화면 이동
  void moveToDetail(){
    Get.back();
    SrcRouteController.to.gotoStoreDetail(
        smid: roomInfo.value.smMId,
        midx: SrcInfoController.to.infoM.value.mIdx,
        index1: null,
        rong: 1
    );
  }

  bool checkDate({
    required bool islength,
    required String regdate1,
    required String regdate2
  }){
    try{
      bool result = islength || DateTime.parse(regdate1).toLocal().day != DateTime.parse(regdate2).toLocal().day;
      return result;
    } catch(_){
      return false;
    }
  }

  bool checkDate2({
    required bool islength,
    required bool isRead,
    required String regdate1,
    required String regdate2
  }){
    try{
      bool result = islength && (DateTime.parse(regdate1).toLocal().day == DateTime.parse(regdate2).toLocal().day) && isRead;
      return result;
    } catch(_){
      return false;
    }
  }

  Future<void> refreshRoomInfo() async{
    final ChatUserRoomList room = await _chatServiceRepository.getRoomByIdx(crIdx: roomInfo.value.crIdx);
    if(room.status == 200){
      roomInfo.value = room.result.first;
      update();

    }
  }

  Future<void> getRoomList(int crIdx) async{
   if(crIdx != 0){
     final ChatUserRoomList room = await _chatServiceRepository.getRoomByIdx(crIdx: crIdx);
     if(room.status == 200){
       roomInfo.value = room.result.first;
       update();

     }
     else{
       if(Get.isSnackbarOpen){
         Get.back();
         Get.back();
       }
       else{
         Get.back();
       }
     }
   } else{
     if(Get.isSnackbarOpen){
       Get.back();
       Get.back();
     }
     else{
       Get.back();
     }
   }
  }
  
  // Rx<DealEstimateList> est = DealEstimateList(
  //     deIdx: 0, deDIdx: 0, deDiIdx: 0, deSmMId: '', deType: '', deJoinTkIdx: 0, dePsName: '',
  //     deFactoryPrice: 0, deSupportPrice: 0, deAddSupportPrice: 0, dePlan: '',
  //     deInstallmentMonth: 0, deSupportType: '', deSale: 0, deSuggestions: '',
  //     deInstallmentPrincipal: 0, deInstallmentInterest: 0, deInstallmentMonthPrice: 0, dePlanBasic: 0, deOptionalSale: 0,
  //     deAgreementSale: 0, dePromotionName: [], dePromotionSale: [], deOptionalMonth: '', deMonthPrice: 0,
  //     deMonthTotalPrice: 0, deEditCnt: 0, deRegdate: DateTime(0), deWelfareSale: 0, dStatus: '', deCash: 0, deTransPrice: 0, deAddTransPrice: 0,deContractPlan: '', deTransYN: '',
  //     smIdx: 0, smStoreName: '', smLatitude: '', smLongitude: '', smToken: '', distance: 0.0, inviteDeal: 0, sendDeal: 0, openDeal: 0, avgPoint: ''
  // ).obs;
  late IO.Socket socket;


  Future<void> getEstimate(String smId) async{
    final DealEstimate estimate = await SrcEstimateController.to.srcEstimateRepository.getDealEstimateByIdx(smMid: smId);
    if(estimate.status == 200){
      estimateList.clear();
      if( estimate.result.where((e) => e.dStatus == "PARTICIPATE" || e.dStatus == "ACCEPT").isNotEmpty){
        final DealEstimateList result =
            estimate.result.where((e) => e.dStatus == "PARTICIPATE").isNotEmpty ?
          estimate.result.firstWhere((e) => e.dStatus == "PARTICIPATE") :
      estimate.result.firstWhere((e) => e.dStatus == "ACCEPT");
        estimateList.add(result);
        update();
      }
      else{
        estimateList.clear();
        menuClick.value = false;
        update();
      }
    }
    else{
      menuClick.value = false;
      estimateList.clear();
      update();
    }
  }


  Future<void> refreshInfo() async{
    await getRoomList(roomInfo.value.crIdx);
    await getEstimate(roomInfo.value.smMId);
    await SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx.toInt());
  }

  void isHiddenFalse () {
    isHidden.value = false;
    scrollEdge.value = false;
    update();
  }

  Future<bool> checkData() async{
    final bool result = await ApiConsole().getInternetStatus();
    return result;
  }
  // connectivityResult == ConnectivityResult.ethernet

  Future<void> reconnectButton() async{
    ChatLogController.to.leaveChatEmit();
    await DeviceManager.overLayClients();
    await ChatLogController.to.socketResume();
    errorLoading.value = false;
    update();
  }


  Future<void> socketResume() async{
    await ChatController.to.logTry(room: roomInfo.value);
    await getRoomList(roomInfo.value.crIdx);
    await getEstimate(roomInfo.value.smMId);
    await initSocket();
  }



  // TODO:// InitSocket
  Future<void> initSocket() async {
    socket = IO.io(
      ApiConsole.chatServer
        // ApiConsole.imageBananaUrl
        ,
        <String, dynamic>{
          'transports': ['websocket'],
          'autoConnect': false,
          'reconnection': false,
          'query': {
            'userName': SrcInfoController.to.infoM.value.mName,
          }
        },
    );
    socket.connect();

    socket.emit('join', {
      'C_room_idx' : '${roomInfo.value.crIdx}',
      'C_type' : 'USER',
      'C_name' : SrcInfoController.to.infoM.value.mName,  //test
      'token' :roomInfo.value.smToken,
      'socket_id': socket.id ?? 'null'//test
    });




    socket.on('joinFail', (_) {
    });

    socket.on('join', (_) {
      if(logError.isNotEmpty){
        socket.emit('chat', logError.first);
        logError.clear();
        update();
      }
    });


    socket.on('chat', (message) async{
      if(message['C_message'].contains('님이 채팅을 종료했어요')){
        await getRoomList(roomInfo.value.crIdx);
        await getEstimate(roomInfo.value.smMId);
      }
      send.value = 0;
      isHidden.value =  chatScrollController.position.pixels > 500 && message['C_type'] != 'USER';
      send.value !=  0   ? '' : getHide(message['C_message']);

      //TODO checkList cRedisIdx 빠질수도 있음.

      if(chatScrollController.position.pixels > 500){
        saveLog.add(ChatLogList(
            cIdx: 0,
            cRoomIdx: int.parse(message['C_room_idx']),
            cMessage: message['C_message'],
            cType: message['C_type'],
            cIsRead: 'Y',
            cRegdate: message['C_regdate'])
        );
        update();
      }
      else{
        ChatController.to.insertChatLog(
          cRoomIdx:  int.parse(message['C_room_idx']),
          cMessage: message['C_message'],
          cType: message['C_type'],
          cIsRead: 'Y',
          cRegdate: message['C_regdate'],
        );
      }
      update();
    });


    //
    // socket.onConnectError((_) async{
    //   await restartSocket();
    // });
    //
    // socket.onConnectTimeout((_) async{
    //   await restartSocket();
    // });
    // socket.onError((_) async{
    //   await restartSocket();
    // });



    // socket.onConnectTimeout((_) =>
    //     log('it is situation that socket timeout')
    // );
    //
    // socket.onError((_) =>
    //     log('it is situation that socket onError')
    // );
    //
    // socket.onPing((_) =>
    //     log('it is situation that socket ping')
    // );
    //
    // socket.onPing((_) =>
    //     log('it is situation that socket pong')
    // );



  }

  void socketDisconnect(){
    socket.disconnect();
  }

  void socketDisconnected(){
    Timer(
        Duration(milliseconds: 200),
            (){
          socket.disconnect();
        }
    );

  }

  void initError(){
    errorMessage.value = ChatError(
        cCase: '',
        cRoomIdx: '',
        cMessage: '',
        cType: '',
        token: '',
        cName: '',
    );
  }

  void updateErrorLaoding2(bool r,){
    errorLoading.value = r;
    update();
  }

  void updateErrorLoading(bool r, bool l){
    errorLoading.value = r;
    loading.value = l;
    update();
  }

  void createError({
    required String cCase,
    required String cRoomIdx,
    required String cMessage,
    required String cType,
    required String token,
    required String cName,
    }){
    errorMessage.value = ChatError(
        cCase: cCase,
        cRoomIdx: cRoomIdx,
        cMessage: cMessage,
        cType: cType,
        token: token,
        cName: cName,

    );
  }

  void leaveChatEmit(){
    if(socket.active){
      getChatList();
      socket.emit('leave', {
        'C_room_idx' : '${roomInfo.value.crIdx}',
      });

      socketDisconnected();
    }

  }

  // TODO:// 메시지 보내기
  Future<void> sendMessage() async{
    final bool network = await checkData();
    if(network){

    String messageText = messageController.text.trim();
    messageController.text = '';
    try{
      if (messageText != '') {

        var messagePost = {
          'C_room_idx' : '${roomInfo.value.crIdx}',
          'C_message': messageText,
          'C_type': 'USER',
          'token' : roomInfo.value.smToken,
          'C_name' : SrcInfoController.to.infoM.value.mName,
        };

        socket.emit('chat', messagePost);
        // for(int i = 0; i < 10000; i++){
        //   socket.emit('chat', messagePost);
        // }

      }
    } catch(e) {
      createError(
          cCase: 'message',
          cRoomIdx: '${roomInfo.value.crIdx}',
          cMessage: messageText,
          cType: 'USER',
          token: roomInfo.value.smToken,
          cName: SrcInfoController.to.infoM.value.mName,
      );
        // Get.back();
        // CommonWidgets().customSnackbar('채팅 연결 시간이 만료되었어요. 다시 입장해주세요.');
      }
    }
    else{
    Get.put(ErrorController());
    ErrorDialog.customErrorDialog(errorCode: 505,  errorRouter: 'chat');
    }
  }

  // TODO:// 딜 초대 메시지
  void sendDeal({required int dIdx}) {
    try{
        var messagePost = {
          'C_room_idx' : '${roomInfo.value.crIdx}',
          'C_message': 'SEND/DEAL/INVITATION/$dIdx',
          'C_type': 'USER',
          'token' : roomInfo.value.smToken,
          'C_name' : SrcInfoController.to.infoM.value.mName,
        };

        socket.emit('chat', messagePost);

        menuClick.value = false;
        update();
    } catch(e){
      createError(
          cCase: 'sendDeal',
          cRoomIdx: '${roomInfo.value.crIdx}',
          cMessage: 'SEND/DEAL/INVITATION/$dIdx',
          cType: 'USER',
          token: roomInfo.value.smToken,
          cName: SrcInfoController.to.infoM.value.mName,
         );
        // CommonWidgets().customSnackbar('채팅 유효시간이 만료되었어요. 다시 입장해주세요');
        // Get.back();
    }
  }

  // 초대하기
  Future<void> invitedDeal(BuildContext context) async{
    if(roomInfo.value.isDealing == 0){
      if(SrcDealController.to.currentDealList.isEmpty) {
        if(context.mounted){
          _commonWidgets.customDialog(
              routerContext: context,
              barrierDismissible: false,
              mainText: '생성된 딜이 없어요. 새로운 딜을 만들어주세요!',
              cancleText: '닫기', confirmText: '딜 만들기',
              conFirmOnTap: () async{
                if(Get.isSnackbarOpen){
                  Get.back();
                }
                else{
                  Get.back();
                  await SrcRouteController.to.makeDeal(context: context, invite: roomInfo.value.smMId);

                }
                update();
              }

          );
        }
      }
      else {
        await refreshInfo();
        if(roomInfo.value.isDealing == 0){
          InviteStore data = await _makeDealRepository.postStoreList(
              diIdx: SrcDealController.to.currentDealList.first.diIdx,
              smMid: roomInfo.value.smMId,
              mName: SrcInfoController.to.infoM.value.mName );
          if(data.status == 200){
            sendDeal(
                dIdx: data.result.first.dIdx,);
            menuClick.value = false;
            await SrcDealController.to.outUpdateInvite(diIdx: SrcDealController.to.currentDealList.first.diIdx);
            await getRoomList(roomInfo.value.crIdx);
          }
          update();
        }
      }
    }
  }

  // TODO:// 수락 메시지 보내기
  void sendAccept(String? reservation) async{
    try{
      var messagePost = {
        'C_room_idx' : '${roomInfo.value.crIdx}',
        'C_message': 'SEND/DEAL/ACCEPT$reservation',
        'C_type': 'USER',
        'token' : roomInfo.value.smToken,
        'C_name' : SrcInfoController.to.infoM.value.mName,
      };

      socket.emit('chat', messagePost);

      menuClick.value = false;
      update();
      // await DealController.to.clickRefresh(Get.context!);

    } catch(e){
      createError(
          cCase: 'sendAccept',
          cRoomIdx: '${roomInfo.value.crIdx}',
          cMessage: 'SEND/DEAL/ACCEPT',
          cType: 'USER',
          token: roomInfo.value.smToken,
          cName: SrcInfoController.to.infoM.value.mName,
      );
    }
  }


  RxInt send = 10.obs;
  RxString imgPath = ''.obs;

  // TODO:// 이미지 보내기
  void sendImage() {
    try{
      var messagePost = {
        'C_room_idx' : '${roomInfo.value.crIdx}',
        'C_message': imgPath.value,
        'C_type': 'USER',
        'token' : roomInfo.value.smToken,
        'C_name' : SrcInfoController.to.infoM.value.mName,

      };

      if(socket.connected){
        socket.emit('chat', messagePost);
        logError.clear();
        update();
      } else{
        logError.add(messagePost);
        update();
      }



      // try{
      //   socket.emit('chat', messagePost);
      // } catch(e){
      //
      // }

      // logError.add(messagePost);
      // if(socket.disconnected){
      //   logError.add(messagePost);
      // } else{
      //   socket.emit('chat', messagePost);
      // }


      menuClick.value = false;
      // if (imgPath.value != '') {
      //
      // }
      update();
    }catch(e){
      createError(
          cCase: 'sendImage',
          cRoomIdx: '${roomInfo.value.crIdx}',
          cMessage: imgPath.value,
          cType: 'USER',
          token: roomInfo.value.smToken,
          cName: SrcInfoController.to.infoM.value.mName,
         );
    }
  }

  // TODO:// 채팅방 종료 메시지

  void sendLeave() {
    try{
        var messagePost = {
          'C_room_idx' : '${roomInfo.value.crIdx}',
          'C_message': '${SrcInfoController.to.infoM.value.mName}님이 채팅을 종료했어요',
          'C_type': 'USER',
          'token' : roomInfo.value.smToken,
          'C_name' : SrcInfoController.to.infoM.value.mName

        };
        socket.emit('chat', messagePost);

    }catch(e){
      createError(
          cCase: 'sendLeave',
          cRoomIdx: '${roomInfo.value.crIdx}',
          cMessage: '${SrcInfoController.to.infoM.value.mName}님이 채팅을 종료했어요',
          cType: 'USER',
          token: roomInfo.value.smToken,
          cName: SrcInfoController.to.infoM.value.mName,
      );
    }
  }

  // 채팅 나가기 알림 메시지
  Future<void> leaveChat(
      { required BuildContext context,} ) async {
    _commonWidgets.customDialog(
        routerContext: context,
        barrierDismissible: false,
         mainText: '채팅방을 나가시면 대화 내용은 모두 삭제됩니다.', cancleText: '취소', confirmText: '나가기',
        conFirmOnTap: () async{
          if(Get.isSnackbarOpen){
            Get.back();
          }
          else{
            AuthBagicApi api = await _chatServiceRepository.roomLeave(crMidx: roomInfo.value.crIdx,);
            if(api.status == 200)
            {
              sendLeave();
              AuthController.to.deleteChat('${roomInfo.value.crIdx}');
              BdBotNavChatController.to.notiUpdate();
              Get.back();
              Get.back();
              _commonWidgets.customSnackbar('채팅방에서 퇴장하셨습니다.');
            }
            update();
          }
        }
    );
  }

  // TODO:// 채팅방 닫을 때 채팅 내역 저장

  void getChatList() {
    if(saveLog.isNotEmpty){
      ChatController.to.addShowLogOuter(saveLog);
      saveLog.clear();
      update();
    }
   ChatController.to.getChatList(roomInfo.value.crIdx);
  }

  // TODO:// 상단 메시지

  String getHide(String hide){
    if(hide.contains('UPLOAD/IMAGES') || hide.contains('{"imageUrl":"UPLOAD')){
      return hiddenText.value = '사진을 보냈습니다.';
    } else{
      if(hide.contains('SEND/DEAL/ACCEPT')){
        return hiddenText.value = '딜을 수락했어요 (알림창)';
      } else{
        if(hide.contains('SEND/DEAL/INVITATION/')){
          return hiddenText.value = '초대장을 보냈습니다.';
        }   else{
          return hiddenText.value = hide;
        }
      }
    }
  }

  // TODO:// 스크롤 이동 관련 함수들

  late final ScrollController barController;
  late final ScrollController chatScrollController;
  RxBool scrollEdge = false.obs;


  void moveScrollInit() async{
    if(chatScrollController.hasClients){
      scrollEdge.value = true;
      update();
      await chatScrollController.animateTo(0.0, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    }
  }
  //
  //
  void moveScroll() async{
    if(chatScrollController.hasClients) {
      if(chatScrollController.position.pixels > 500){

      } else{
        scrollEdge.value = true;
        update();
        await chatScrollController.animateTo(0.0, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
      }
    }
  }

  Future<void> waitForClients() async {
    while (!chatScrollController.hasClients) {
      await Future.delayed(Duration(milliseconds: 100)); // 일정 시간 동안 대기
    }
  }

 Future<void> inputImage(String msg) async{
    await waitForClients();
    imgPath.value = msg;
    update();
  }

  void moveScrollButton() {
    moveScrollInit();
  }


  void clickMenuBar(){
    menuClick.value =! menuClick.value;
  }

  void _controllerClose(){
    messageController.dispose();
    chatScrollController.dispose();
    focus.dispose();
    barController.dispose();
  }

  // TODO: GetX worker

  void closeChatLog(){
    Get.back();
    ChatController.to.openLoading.value = 3;
    BdBotNavChatController.to.notiUpdate();
    update();
  }

  RxBool reservationValue = false.obs;

  void reservationChange(){
    reservationValue.value = true;
    update();
  }

  late DealEstimateList esti;
  late BuildContext conx;

  void setReservationValue({
    required DealEstimateList es,
    required BuildContext co,
  }) {
    esti = es;
    conx = co;
    update();
  }

  Future<void> reservationGo({
   required DealEstimateList est,
   required BuildContext context,
  }) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? reservation = prefs.getString(InfoString.saveReservation);

     loading.value = true;
     if(est.dStatus != 'ACCEPT' && est.dStatus == 'PARTICIPATE'){
       final AuthBagicApi confirm = await _srcDealRepository.sendConfirmDeal(
           deDidx: est.deDIdx,
           dDiIdx: est.deDiIdx,
           mName: SrcInfoController.to.infoM.value.mName,
           smMid: roomInfo.value.smMId,
         mIdx: SrcInfoController.to.infoM.value.mIdx
       ); //추가해야됨
       if(confirm.status == 200){
         await SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx.toInt());
         // await SrcDealController.to.getDealEstimate(est.deDIdx);
         // await DealController.to.refreshListEnd(est.deDIdx);
         est.dStatus = 'ACCEPT';
         sendAccept(reservation);
         await prefs.remove(InfoString.saveReservation);
         reservationValue.value = false;
         update();
       }
       else{
         if(confirm.status == 402){
           _commonWidgets.customDialogButton1(
               routerContext: context,
               onTap: (){
                 Get.back();
               }, mainText: confirm.msg, buttonText: '확인');
         }
       }
       loading.value = false;
     }
  }

  @override
  void onInit() async{
    super.onInit();
   try{
     messageController = TextEditingController();
     chatScrollController =  ScrollController();
     barController =  ScrollController();
     focus = FocusNode();
     chatScrollController.addListener(() {
       if(chatScrollController.position.pixels != 0.0)
       {
         scrollEdge.value = false;
       }
       if(chatScrollController.position.pixels == 0.0){
         scrollEdge.value = true;
       }
       if(chatScrollController.position.pixels == chatScrollController.position.maxScrollExtent){
         ChatController.to.loadMoreItems();
       }
       if(chatScrollController.position.pixels <= 500 && saveLog.isNotEmpty){
         ChatController.to.addShowLogOuter(saveLog);
         saveLog.clear();
         update();
       }
     });
     await getRoomList(int.parse(Get.parameters['crIdx'] ?? '0'));
     await getEstimate(roomInfo.value.smMId);
     await initSocket();
   } catch(_){
     Get.back();
   }

  }


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    ever(send,  (_){
      moveScroll();
      Timer(const Duration(milliseconds: 100),
              (){
            send.value = 10;
            update();
          }
      );
    }
        // Timer(const Duration(milliseconds: 10),
        //         (){
        //           if(send.value == 0){
        //               moveScroll();
        //               Timer(const Duration(milliseconds: 10),
        //                    (){
        //                     send.value = 10;
        //                     update();
        //                 }
        //               );
        //           }
        //   }
        // )
    );

    debounce(imgPath,(_) {
     if(imgPath.value != ''){
       Timer(const Duration(milliseconds: 10),
               (){
                 sendImage();
                 Timer(const Duration(seconds: 1),
                         (){
                           moveScrollInit();
                           imgPath.value = '';
                           update();
                  }
                 );
                }
                );
        }
      }
    );

    debounce(reservationValue, (_) async{
      if(reservationValue.value){
        await reservationGo(est: esti, context: conx);
        await refreshInfo();
      }
    });

  }

  @override
  void onClose(){
    // TODO: implement onClose
    //await leaveChatEmit();
    _controllerClose();
    leaveChatEmit();
    loading.value = false;
    update();
    ChatController.to.changeOpenLoading(3);
    BdBotNavChatController.to.notiUpdate();
    super.onClose();
  }


}