import 'dart:async';
import 'dart:convert';
import 'package:banana_deal_by_monkeycompany/app/managers/socket_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/store/invite_store_idx.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_user_room_list.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/bdbot/bd_bot_nav_rapository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/store/store_repository.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../../components/carousel/src/helpers/carousel_controller.dart';
import '../../../../../../../components/common_widgets.dart';
import '../../../../../../../components/future_loading_overlay.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../managers/device_manager.dart';
import '../../../../../../../models/auth_basic_api.dart';
import '../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../models/store/store_detail_review.dart';
import '../../../../../../../models/store/user_declaration_review.dart';
import '../../../../../../../repository/etc/bookmark_repository.dart';
import '../../../../../../../routes/api_url.dart';
import '../../../../../../main/auth/auth_controller.dart';
import '../../../../../../main/loading/loading_controller.dart';
import '../../../../../../naver_maps/pages/naver_marker_static/naver_marker_static_controller.dart';
import '../../../../../../naver_maps/pages/naver_marker_static/naver_marker_static_view.dart';
import '../../../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_store_controller.dart';
import '../../../../../src_components/controllers/src_deal_controller.dart';
import '../../../../../src_components/controllers/src_info_controller.dart';
import '../../../../../src_components/controllers/src_route_controller.dart';
import '../../../../widgets/service/chat_service_controller.dart';


class StoreDetailController extends GetxController with GetSingleTickerProviderStateMixin{
  static StoreDetailController get to => Get.find();

  final BookmarkRepository _bookmarkRepository;
  final BdBotNavRepository _bdBotNavRepository;
  final StoreRepository _storeRepository;
  final CommonWidgets commonWidgets;

  StoreDetailController({
    required BookmarkRepository bookmarkRepository,
    required BdBotNavRepository bdBotNavRepository,
    required StoreRepository storeRepository,
    required this.commonWidgets,
  }) :  _bookmarkRepository = bookmarkRepository,
        _bdBotNavRepository = bdBotNavRepository,
        _storeRepository = storeRepository;

  final SocketManger _socketManger = SocketManger();



  final RxBool dialogOpen = true.obs;
  final RxBool isOpen = false.obs;
  final CarouselController cController = CarouselController();

  RxBool listDirection = false.obs;
  RxBool loadingBar = false.obs;
  RxBool reviewLast = false.obs;
  final RxInt reviewPage = 0.obs;


  /*
  TODO:  상점 디테일 페이지 전체 상태
  */

  //상점 디테일 정보
  Rx<StoreDetail> storeDetail = StoreDetail(smIdx: 0, smMId: '', smStoreName: '', smAddress: '', smTel: '', smCity: '',
    smCity2: '', smCity3: '', smPathImg0: '', smPathImg1: '', smPathImg2: '', smPathImg3: '', smPathImg4: '', smPathImg5: '',
    smStoreIntroduce: '', smConsultationTime: '', smTimeStart: '', smTimeEnd: '', smEvent1: '', smEvent2: '', smEvent3: '', smIconEvent1: '',
    smIconEvent2: '', smIconEvent3: '', smMessage: '', smLatitude: '', smLongitude: '', smRegdate: '', avgPoint: '', reviewCnt: 0,
    favoriteStore: 0, isDealing: 0, dealYN: 0,
  ).obs;

  RxList<StoreReViewList> reViewListAll = <StoreReViewList>[].obs;

  // 정보 갱신 실패 여부
  RxBool updateFail = false.obs;


  //갱신 성공 이후 , 위젯에 전해지는 데이터들

  List storePreView = [];
  List storeEvent = [];
  List storeIcon = [];


  void statusOk(){

    storePreView = [storeDetail.value.smPathImg0,
      storeDetail.value.smPathImg1, storeDetail.value.smPathImg2,
      storeDetail.value.smPathImg3, storeDetail.value.smPathImg4, storeDetail.value.smPathImg5];
    storePreView.removeWhere((element) => element == '');
    storeEvent = [storeDetail.value.smEvent1, storeDetail.value.smEvent2, storeDetail.value.smEvent3];
    storeIcon = [storeDetail.value.smIconEvent1, storeDetail.value.smIconEvent2, storeDetail.value.smIconEvent3];

    update();
  }

  RxString dayPas = ''.obs;

  // 시간 변환
  bool makeTime(){
    try{
      if(storeDetail.value.smTimeStart == '' || storeDetail.value.smTimeEnd == ''){
        update();
        return false;
      }
      else{
        List<String> dayList = storeDetail.value.smConsultationTime.split(',');
        if(dayList.where((element) => element == 'Y').length == 7){
          dayPas.value = '매일';
        }
        else if(dayList.where((element) => element == 'Y').length == 6 && dayList.last == 'N'){
          dayPas.value = '월~토';
        }
        else if(dayList.where((element) => element == 'Y').length == 5 && dayList[5] == 'N' && dayList[6] == 'N'){
          dayPas.value = '평일';
        }
        else if(dayList.where((element) => element == 'N').length == 5 && dayList[5] == 'Y' && dayList[6] == 'Y'){
          dayPas.value = '주말';
        }
        else{
          List<String> daylll = [];
          for(int i = 0; i < dayList.length; i++){
            if(dayList[i] == 'Y'){
              daylll.add(switch(i){
                0 => '월,',
                1 => '화,',
                2 => '수,',
                3 => '목,',
                4 => '금,',
                5 => '토,',
                6 => '일,',
                _ => ''
              });
            }
          }
          String joinString = daylll.join('');
          String newString = joinString.substring(0, joinString.length - 1);
          dayPas.value = newString;
        }

        int startHour = int.parse(storeDetail.value.smTimeStart.split(':')[0]);
        int startmin = int.parse(storeDetail.value.smTimeStart.split(':')[1]);
        int endHour = int.parse(storeDetail.value.smTimeEnd.split(':')[0]);
        int endmin = int.parse(storeDetail.value.smTimeEnd.split(':')[1]);
        DateTime now = DateTimeConfig().now;
        // log(dayList.length.toString());
        // log('ww${now.weekday}');
        // log('wwdd${dayList[now.weekday-1]}');

        DateTime time = DateTime(now.year, now.month, now.day, now.hour, now.minute);
        DateTime startTime  = DateTime(now.year, now.month, now.day, startHour, startmin);
        DateTime endTime  = DateTime(now.year, now.month, now.day, endHour, endmin);
        bool isOpen = time.isAfter(startTime) && time.isBefore(endTime) && dayList[now.weekday-1] == 'Y';
        update();
        return isOpen;
      }
    }catch(_){

      return false;
    }
  }

  Future<void> getAddReview({required int page}) async{
    loadingBar.value = true;
    update();
    await Future.delayed(Duration(milliseconds: 800));
    StoreReview store =  await _bdBotNavRepository.getStoreDetailReview(
        smMid: smId.value,
        mIdx: SrcInfoController.to.infoM.value.mIdx,
        page: page*10,
        length: 10);
      if(store.status == 200){
        reViewListAll.addAll(store.result);
        update();
      }
    loadingBar.value = false;
    update();
  }

  void _getDetailFail(){
    updateFail.value = false;
    reViewListAll.value = [];
    update();
    Get.back();
    commonWidgets.customSnackbar('현재 해당 매장의 정보를 불러올 수 없습니다.');
  }

  void _getDetailSuccess(List<StoreReViewList> list){
    updateFail.value = true;
    reViewListAll.value = list;
    update();
  }


  // 페이지 첫 클릭 갱신 - FutureBuilder
  Future<StoreDetail> getDetail({required smMid, required mIdx, required bool isReset }) async{
    try{
      reviewPage.value = 0;
      reviewLast.value = false;
      smId.value = smMid;
      StoreReview all = await _bdBotNavRepository.getStoreDetailReview(smMid: smMid, mIdx: mIdx, page: 10*reviewPage.value, length: 10);
      StoreDetailInfo detail =
      switch(isReset){
        true =>
        await showFutureLoadingOverlay<dynamic>(
            context: Get.context!,
            future:  _bdBotNavRepository.getStoreDetail(smMid: smMid, mIdx: SrcInfoController.to.infoM.value.mIdx),
            expanded: true
        ),
        false => await _bdBotNavRepository.getStoreDetail(smMid: smMid, mIdx: SrcInfoController.to.infoM.value.mIdx)
      };

      if(detail.result.isEmpty)
      {
        _getDetailFail();
        return storeDetail.value = detail.result.first;
      }
      else{

        if(all.status == 200 && detail.status == 200){
          _getDetailSuccess(all.result);
          return storeDetail.value = detail.result.first;
        }
        else{
          if(all.status != 200 && detail.status == 200) {
            _getDetailSuccess([]);
            return storeDetail.value = detail.result.first;
          }
          else{
            _getDetailFail();
            return  storeDetail.value = detail.result.first;
          }
        }
      }
    } catch(_){
      _getDetailFail();
      return storeDetail.value;
    }
  }

  Future<void> checkReview({required int page}) async{
    if(!reviewLast.value){
      StoreReview review = await _bdBotNavRepository.getStoreDetailReview(
          smMid: smId.value,
          mIdx: SrcInfoController.to.infoM.value.mIdx,
          page: 10*page, length: 10
      );
      if(review.status == 200){
        reviewPage.value++;
        update();
      }
      else{
        reviewLast.value = true;
        update();
      }
    } else{

    }
  }


  Future<void> inviteDealDialog(BuildContext context) async{
    commonWidgets.customDialog(
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
            await SrcRouteController.to.makeDeal(context: context, invite: storeDetail.value.smMId);
          }
          update();
        }

    );
  }


  /*
  TODO:  크로셀 상태 관리
  */





  //크로셀 페이지
  RxInt current = 0.obs;

  //페이지 변경
  void pageCanged(int index) {
    current.value = index;
    update();
  }


  /*
  TODO:  탭 버튼 상태관리
  */

  late TabController tabController;
  RxInt currentTap = 0.obs;

  void tabselect() async{
    currentTap.value = tabController.index;
    await moveScrollInit();
    update();
  }

  //전체보기 버튼
  void selectAll(){
    currentTap.value = 1;
    tabController.index = 1;
  }


  /*
  TODO:  상단 버튼
  */

  //전화하기
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  //지도에서 보기
  Future<void> gotoMap({required String name, required String road, required double latitude, required double longtitude}) async{
    await DeviceManager.overLayClients();
    Get.to(
            () => NaverMarkerStaticView(
              name: name ,road: road, latitude: latitude, longtitude: longtitude,), binding:
    BindingsBuilder(() {
      Get.put(NaverMarkerStaticController());
    }));
  }

  Future<void> launchNaverMap({required String name, required String road,  required double latitude, required double longtitude}) async {
    try {
      final encode = Uri.encodeFull(name);
      final url = 'nmap://place?lat=$latitude&lng=$longtitude&name=$encode';
      final uri = Uri.parse(url);
      if(await launchUrl(uri))
      {

      } else{
        await launchUrlKakao(name: name, road: road, latitude: latitude, longtitude: longtitude);
      }
    } catch(_){
      await launchUrlKakao(name: name, road: road, latitude: latitude, longtitude: longtitude);
    }
  }


  Future<void> launchUrlKakao({required String name, required String road, required double latitude, required double longtitude}) async {
    try{
      final url = 'kakaomap://look?p=$latitude,$longtitude';
      final uri = Uri.parse(url);
      if(await launchUrl(uri)){

      }else{
        await gotoMap(name: name, road: road, latitude: latitude, longtitude: longtitude);
      }
    } catch(_){
      await gotoMap(name: name, road: road, latitude: latitude, longtitude: longtitude);
    }
  }


  //공유하기
  Future<void> shareStore() async{
    String message = "STORE/${storeDetail.value.smIdx}";
    String encode = base64.encode(utf8.encode(message));
    String url = '${ApiConsole.shareMode}/$encode';
    try{
      await Share.share("'${storeDetail.value.smStoreName}' 추천합니다. 바나나딜 앱에서 확인해보세요.\n$url");
    } catch(_){
      commonWidgets.customSnackbar('공유를 사용할 수 없는 플랫폼으로 로그인 중입니다.');
    }

  } 



  /*
  TODO:  하단 버튼 (딜 초대하기, 채팅 초대하기)
  */


  Future<void> invitedStore2({required String smId}) async{
    final int mIdx = SrcInfoController.to.infoM.value.mIdx;
    final String mName = SrcInfoController.to.infoM.value.mName;
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      if(SrcDealController.to.currentDealList.isNotEmpty){
        InviteStoreIdx api = await LoadingController.to.apiLoadings(
            future:  _storeRepository.postStoreList(
                smMid: storeDetail.value.smMId,
                diIdx: SrcDealController.to.currentDealList.first.diIdx,
                mName: mName
            ),
            text: Style.infoMent
        );
        await SrcDealController.to.outUpdateInvite(diIdx: SrcDealController.to.currentDealList.first.diIdx);
        if(api.status == 200){
          try{
            await sendInvite(mIdx: mIdx, mName: mName, dIdx: api.result.first.dIdx);
          } catch(_){
           try{
             await sendInvite(mIdx: mIdx, mName: mName,  dIdx: api.result.first.dIdx);
           } catch(_){

           }
          }
          commonWidgets.customSnackbar('초대장을 보냈어요.');
          try{
            await getDetail(smMid: smId, mIdx: SrcInfoController.to.infoM.value.mIdx, isReset: true);

          } catch(_){
            if(Get.isSnackbarOpen){
              Get.back();
            }
            Get.back();
          }
        }
        else{
          if(api.status < 500){
            commonWidgets.customSnackbar('이미 초대장을 보낸 매장입니다.');
          }
          else{
            commonWidgets.customSnackbar('잠시 후, 다시 시도해주세요.');
          }
        }
      }
      else{

      }
    }
  }

  Future<void> sendInvite({
    required int mIdx,
    required String mName,
    required int dIdx
  }) async{
    final RoomList chatRoom = await SocketRepository().getRoomByIdxSMid(mIdx: mIdx, smId: storeDetail.value.smMId, storeName: storeDetail.value.smStoreName);
    if(chatRoom.crIdx != -1){
      final IO.Socket socketIo = await _socketManger.initSocket();
      bool result = await _socketManger.joinRoom(
        socket: socketIo,
        mName: mName,
        socketEnum: SocketEnum.invite,
        room: chatRoom,
        dIdx: dIdx,
      );
        if (!result) {
          await Future.delayed(Duration(milliseconds: 200));
          await _socketManger.joinRoom(
            socket: socketIo,
            mName: mName,
            socketEnum: SocketEnum.invite,
            room: chatRoom,
            dIdx: dIdx,
          ); // 잠시 대기 후 재시도
        }

      await _socketManger.codeLeave(crIdx: '${chatRoom.crIdx}', socket: socketIo, isMulti: false);
    }
  }


  GestureTapCallback detailInviteBtN(BuildContext context){
    return
    SrcDealController.to.currentDealList.isEmpty
        ?
        (){
          commonWidgets.customSnackbar('새로운 딜을 생성해주세요');
    }
        :
    storeDetail.value.dealYN != 0
        ?
        (){
          commonWidgets.customDialogButton1(
              routerContext: context,
              onTap: () {
        Get.back();
      }, mainText: '이미 수락한 딜이 있어요.', buttonText: '확인');
    }
        :
    storeDetail.value.isDealing == 0 ? () async{
      await invitedStore2(smId: storeDetail.value.smMId);
    }
        :
    storeDetail.value.isDealing != 0 ?
        (){
          commonWidgets.customDialogButton1(
              routerContext: context,
              onTap: () {
        Get.back();
      }, mainText: '이미 초대장을 받은 매장이에요.', buttonText: '확인');
    } : (){};
  }


  void clickChatCunsulting(context){
    ChatServiceController.to.createChat2(crSmid: storeDetail.value.smMId, context: context, smName:  storeDetail.value.smStoreName, message: '', );
  }


  /*
  TODO:  기타 위젯 상태관리
  */
  Future<void> moveScrollInit() async{
    if(scrollController.hasClients){
      await scrollController.animateTo(scrollController.position.minScrollExtent, duration: const Duration(milliseconds: 1), curve: Curves.easeIn);
    }
  }

  // 리스트 뷰 컨트롤러
  late final ScrollController scrollController;


  // 사진 클릭시 확대


  /*
  TODO:  리뷰 영역 상태관리
  */

  //이전 페이지에서 받은 smId 상태를 유지하기 위해 사용
  RxString smId = ''.obs;


  //Visibility 아이콘 상태 관리
  void changeVisibility(StoreReViewList review){
    review.visible == 'Y'
        ? review.visible = 'N'
        : review.visible = 'Y';
    update();
  }

  RxInt reviewStatusChangeGetDetail = 0.obs;

  // 소켓 필요없는 차단 추가
  Future<void> blockCreate({required String peIdx, required String smMid, required String name}) async{

    AuthBagicApi2 api = await _bookmarkRepository.userBlockCreate(
        buMidx: SrcInfoController.to.infoM.value.mIdx.toString(),
        peIdx: peIdx,
        smMid: smMid,
        diIdx: SrcDealController.to.currentDealList.isEmpty
                ? '' : SrcDealController.to.currentDealList.first.diStatus != '진행중' ? '' : '${SrcDealController.to.currentDealList.first.diIdx}'
    );
    if(api.status == 200){
      if(peIdx == ''){
        Get.back();
        Get.back();
        BdBotNavStoreController.to.changeValue();
        await SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx.toInt());
      }else{
        Get.back();
        reviewStatusChangeGetDetail.value = 20;
      }
      commonWidgets.customSnackbar(peIdx == '' ? '$name 매장이 차단되었습니다.' : '$name 유저가 차단 되었습니다.');
    }
    else{
      if(api.status == 400){
        commonWidgets.customSnackbar(peIdx == '' ? '이미 차단된 매장입니다.' : '이미 차단된 유저입니다.');
      }
    }
  }


  // TODO: 차단 기능에서 사용되는 소켓 컨트롤

  Future<void> blockCreateExitChat({required String peIdx, required String smMid, required String name}) async{
    final RoomList chatRoom = await SocketRepository().getRoomByIdxSMid(
        mIdx: SrcInfoController.to.infoM.value.mIdx,
        smId: storeDetail.value.smMId, storeName: storeDetail.value.smStoreName
    );
      socketStatusChange.value = 20;
      AuthBagicApi2 api = await _bookmarkRepository.userBlockCreate(
          buMidx: SrcInfoController.to.infoM.value.mIdx.toString(), peIdx: peIdx, smMid: smMid,
          diIdx: SrcDealController.to.currentDealList.isEmpty
              ? '' : SrcDealController.to.currentDealList.first.diStatus != '진행중' ? '' : '${SrcDealController.to.currentDealList.first.diIdx}'
      );
      if(api.status == 200){
        try{
          await confirmBlock(chatRoom);
        } catch(_){
          try{
            await confirmBlock(chatRoom);
          } catch(_){

          }
        }
        if(peIdx == ''){
          Get.back();
          Get.back();
          BdBotNavStoreController.to.changeValue();
          await SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx.toInt());
        }else{
          Get.back();
          reviewStatusChangeGetDetail.value = 20;
        }
        commonWidgets.customSnackbar(peIdx == '' ? '$name 매장이 차단되었습니다.' : '$name 유저가 차단 되었습니다.');
      }
      // if(api.status == 200){
      //   sendMessage.value = false;
      //   Get.back();
      //   Get.back();
      //   BdBotNavStoreController.to.changeValue();
      //   commonWidgets.customSnackbar(peIdx == '' ? '$name 매장이 차단되었습니다.' : '$name 유저가 차단 되었습니다.');
      // }

  }

  RxInt socketStatusChange = 0.obs;

  Future<void> confirmBlock(RoomList chatRoom) async{

    if(chatRoom.crIdx != -1){

      final IO.Socket socketIo = await _socketManger.initSocket();
      bool result = false;
      while(!result){
        result = await _socketManger.joinRoom(
          mName: SrcInfoController.to.infoM.value.mName,
          socket: socketIo,
          socketEnum: SocketEnum.leave, dIdx: 0, room: chatRoom,
        );
        if (!result) {
          await Future.delayed(Duration(milliseconds: 300)); // 잠시 대기 후 재시도
        }
      }
      await _socketManger.codeLeave(crIdx: '${chatRoom.crIdx}', socket: socketIo, isMulti: false);
    }
    AuthController.to.deleteChat(chatRoom.crIdx.toString());
  }


  Future<void> createFavorite({required fSmMid}) async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else {
      AuthBagicApi api = await LoadingController.to.apiLoadings(
          future: _storeRepository.favoriteCreate(
              fMidx: SrcInfoController.to.infoM.value.mIdx, fSmMid: fSmMid
          ),
          text: Style.infoMent
      );
      if(api.status == 200){
        storeDetail.value.favoriteStore = 1;
        update();
      }
    }
  }

  Future<void> deleteFavorite({required fSmMid}) async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      AuthBagicApi api = await LoadingController.to.apiLoadings(
          future: _storeRepository.favoriteDelete(
              fMidx: SrcInfoController.to.infoM.value.mIdx, fSmMid: fSmMid
          ),
          text: Style.infoMent
      );
      if(api.status == 200){
        storeDetail.value.favoriteStore = 0;
        update();
      }
    }
  }




  //TODO: 신고하기 다이어로그에서 사용하는 상태들

  RxInt declarationLoading = 0.obs;

  Future<void> postDeclaration({
    required int bruMidx, required String bruType, required String bruMidxPe,
    required String bruSmMid, required String bruTitle, required String bruContent, required String bruRuidx,
    required String bruPathImageEdit1, required String bruPathImageEdit2, required String bruPathImageEdit3
  }) async{
   declarationLoading.value = 20;
   final String result = DeviceManager.emojiConvert(bruContent);
    AuthBagicApi api = await _bdBotNavRepository.userReportCreate(
        bruMidx: bruMidx, bruType: bruType, bruMidxPe: bruMidxPe,
        bruSmMid: bruSmMid, bruTitle: bruTitle, bruContent: result, bruRuIdx: bruRuidx,
        bruPathImageEdit1: bruPathImageEdit1, bruPathImageEdit2: bruPathImageEdit2, bruPathImageEdit3: bruPathImageEdit3);
    if(api.status == 200){
      declarationLoading.value = 30;

    } else if(api.status == 400){
      declarationLoading.value = 15;
    }
    else if(api.status == 404){
      declarationLoading.value = 10;
    }
  }

  late FocusNode focus;

  RxString dropdownValue = ''.obs;

  RxString declarationInput = ''.obs;

  Future<bool> checkDeclaration({
    required String type,
    required String userIdx,
    required String smId,
    required String ruIdx,
  }) async{
    final UserDeclarationReview decla = await _bookmarkRepository.userPostDeclarationList(SrcInfoController.to.infoM.value.mIdx);
    final bool result = switch(type){
      'REVIEW' => decla.result.where((element) => element.bruType == type && element.bruRuIdx == ruIdx).isEmpty,
      _ => decla.result.where((element) => element.bruType == type && element.bruSmMid == smId).isEmpty
    };
    return result;
  }


  void inputDeclaration(val) {
    declarationInput.value = val;
  }

  RxList<CroppedFile?> imagePath = <CroppedFile?>[null,null,null].obs;

  double imageSize = WidgetSize(Get.context!).sizedBox121;

  List<String> items = ['욕설 또는 폭력적인 표현을 사용해요','음란한 표현을 사용해요','사행성을 조장해요','허위적인 내용을 다루고 있어요','다른 문제가 있어요'];

  void switchRouteCaseUpload(int index){
    switch(index){
      case 0:
        SrcRouteController.to.gotoUpload('declaration $index');
        break;
      case 1:
        SrcRouteController.to.gotoUpload('declaration $index');
        break;
      case 2:
        SrcRouteController.to.gotoUpload('declaration $index');
        break;
    }
  }

  void switchRouteCaseDelete({
    required BuildContext context,
    required int index
  }){
    commonWidgets.customDialog(
        routerContext: context,
        barrierDismissible: false,
         mainText: '선택한 사진의 등록을 삭제하시겠어요?', cancleText: '취소', confirmText: '삭제하기',
        conFirmOnTap: (){
          imagePath[index] = null;
          Get.back();
        });
  }

  void initDeclaration(){
    declarationLoading.value = 0;
    dropdownValue.value = '';
    declarationInput.value = '';
    imagePath.value = <CroppedFile?>[null,null,null];
  }


  Future<void> reloadDetail() async{
    await getDetail(smMid: smId.value, mIdx: SrcInfoController.to.infoM.value.mIdx, isReset: true);
  }


  void _controllerClose(){
    tabController.dispose();
    scrollController.dispose();
    focus.dispose();

  }

  RxDouble deviceHeight = WidgetSize(Get.context!).height60px.obs;


  // TODO: 컨트롤러 워커

  @override
  void onInit() async{
      tabController = TabController(length: 2, vsync: this);
      tabController.addListener(tabselect);
      scrollController = ScrollController();
      focus = FocusNode();

      scrollController.addListener(() async{
        if(currentTap.value == 1){
          if(scrollController.position.maxScrollExtent == scrollController.position.pixels)
          {
            if( !reviewLast.value){
              await checkReview(page: reviewPage.value+1);
            }
          }
          // if(scrollController.position.userScrollDirection == ScrollDirection.reverse ){
          //   listDirection.value = true;
          //   update();
          // } else {
          //   listDirection.value = false;
          //   update();
          // }
        }
      });

    super.onInit();


  }

  @override
  void onReady() {
    super.onReady();
    debounce(reviewStatusChangeGetDetail, (_) async{
      if(reviewStatusChangeGetDetail.value == 20)
      {
        await getDetail(smMid: smId.value, mIdx: SrcInfoController.to.infoM.value.mIdx, isReset: true);
      }

    }
    );

    debounce(declarationLoading,(_){
      if(declarationLoading.value == 30){
        Get.back();
        commonWidgets.customSnackbar('신고가 완료되었어요.');
        initDeclaration();
        reviewStatusChangeGetDetail.value = 20;
      }
      if(declarationLoading.value == 10){
        reviewStatusChangeGetDetail.value = 0;
        commonWidgets.customSnackbar('이전 신고내용이 처리중입니다.');
      }
      if(declarationLoading.value == 15){
        reviewStatusChangeGetDetail.value = 0;
        commonWidgets.customSnackbar('입력값이 잘못되었습니다.');
      }
    });

    debounce(reviewPage, (_) async{
      if(reviewPage.value != 0 && !reviewLast.value){
        await getAddReview(page: reviewPage.value);
        update();
      }
    });


    ever(storeDetail, (_) {
      statusOk();
      isOpen.value = makeTime();
    });
  }

  @override
  void onClose(){
    _controllerClose();
    super.onClose();
  }

}

