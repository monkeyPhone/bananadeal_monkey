import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/neumorphic/flutter_neumorphic.dart';
import 'package:banana_deal_by_monkeycompany/app/models/auth_basic_api.dart';
import 'package:banana_deal_by_monkeycompany/app/models/deal/page_info.dart';
import 'package:banana_deal_by_monkeycompany/app/models/room_list_page.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/controllers/chat_controller.dart';
import 'package:get/get.dart';
import '../../../pages/widgets/service/service_model/chat_user_room_list.dart';
import '../../../../../repository/chat/chat_service_repository.dart';
import '../../controllers/src_info_controller.dart';

class BdBotNavChatController extends GetxController{
  static BdBotNavChatController get to => Get.find();

  final ChatServiceRepository _chatServiceRepository;

  BdBotNavChatController({
    required ChatServiceRepository chatServiceRepository
  }) : _chatServiceRepository = chatServiceRepository;

  final ScrollController scrollController = ScrollController();

  RxInt currentPage = 1.obs;
  RxInt roomListStatus = 0.obs;
  RxInt chatLength = 0.obs;
  RxList<RoomList> chatRoomList = <RoomList>[].obs;
  Rx<AllPageInfo> chatRoomInfo = AllPageInfo(total: 0, totalPages: 0).obs;
  RxBool loading = false.obs;

  Future<void> notiUpdate() async{
    await getReloadRoom();
    await circulateRead();
    ChatController.to.changeOpenLoading(0);
  }

  Future<void> errorInit() async{
    if(scrollController.hasClients){
      scrollController.jumpTo(0.0);
    }
    ChatController.to.changeOpenLoading(3);
    await circulateRead();
    await getRoomPageInit();
    ChatController.to.changeOpenLoading(0);
  }

  void changeIndex(){
    currentPage.value++;
    update();
  }

  Future<void> getRoomPageInit() async{
    try{
      roomListStatus.value = 0;
      currentPage.value = 1;
      update();
      RoomListPage page = await _chatServiceRepository.getRoomPage(
        mIdx: SrcInfoController.to.infoM.value.mIdx,
        page: 1,
      );

      roomListStatus.value = page.status;
      update();
      if(page.status == 200){
        minusMaxPage(page.result.first.totalPages);
        chatRoomList.value = page.result.first.list;
        chatRoomInfo.value = AllPageInfo(
            total: page.result.first.total,
            totalPages: page.result.first.totalPages
        );
        update();
      }
      else{
        if(page.status == 400){
          chatRoomList.value = [];
          roomListStatus.value = page.status;
          chatRoomInfo.value = AllPageInfo(total: 0, totalPages: 0);
          update();
        }else{
          chatRoomList.value = [];
          roomListStatus.value = 502;
          chatRoomInfo.value = AllPageInfo(total: 0, totalPages: 0);
          update();
        }
      }
    } catch(_){
      chatRoomList.value = [];
      roomListStatus.value = 502;
      chatRoomInfo.value = AllPageInfo(total: 0, totalPages: 0);
      update();
    }
  }

  Future<void> getReloadRoom() async{
    List<RoomList> result = [];
    for(int i = 1; i <= currentPage.value; i++){
      result.addAll(await reloadAdd(i));
    }
    chatRoomList.value = result;
    update();
  }

  Future<List<RoomList>> reloadAdd(int index) async{
    RoomListPage page = await _chatServiceRepository.getRoomPage(
      mIdx: SrcInfoController.to.infoM.value.mIdx,
      page: index,
    );
    roomListStatus.value = page.status;
    update();
    if(page.status == 200){
      minusMaxPage(page.result.first.totalPages);
      chatRoomInfo.value = AllPageInfo(
          total: page.result.first.total,
          totalPages: page.result.first.totalPages
      );
      update();
      return page.result.first.list;
    }
    else{
      if(page.status == 400){
        roomListStatus.value = 400;
        chatRoomInfo.value = AllPageInfo(total: 0, totalPages: 0);
        update();
        return [];
      }
      else{
        roomListStatus.value = 502;
        chatRoomInfo.value = AllPageInfo(total: 0, totalPages: 0);
        update();
        return [];
      }
    }
  }

  void minusMaxPage(int total){
    if(currentPage.value > total){
      currentPage.value = total;
      update();
    }
  }

  Future<void> addRoomPage() async{
    changeIndex();
    RoomListPage page = await _chatServiceRepository.getRoomPage(
        mIdx: SrcInfoController.to.infoM.value.mIdx,
        page: currentPage.value,
    );
    roomListStatus.value = page.status;
    update();
    if(page.result.isNotEmpty){
      chatRoomList.addAll(page.result.first.list);
      update();
    }
    else{
      chatRoomList.value = [];
      roomListStatus.value = 502;
      chatRoomInfo.value = AllPageInfo(total: 0, totalPages: 0);
      update();
    }
  }


  Future<void> circulateRead() async {
    chatLength.value = 0;
    update();
    AuthBagicApi api = await _chatServiceRepository.getCisReadTotal(mIdx: SrcInfoController.to.infoM.value.mIdx);
    roomListStatus.value = api.status;
    if(api.result.isNotEmpty){
      chatLength.value = api.result.first;
      update();
    }
    else{
      chatLength.value = 0;
      update();
    }
  }

  Future<List<RoomList>> getRoomList(int mIdx) async {
    ChatUserRoomList data = await _chatServiceRepository.getRoomList(
        mIdx: mIdx);

    if (data.status == 200 && data.result.isNotEmpty) {
      if(data.result.where((element) => element.crStatus == 'NORMAL' ||  element.crStatus == 'STORE_EXIT').isNotEmpty){
        List<RoomList> list = data.result.where((element) => element.crStatus == 'NORMAL' ||  element.crStatus == 'STORE_EXIT').toList();
        return list;
      }
      else{
        return [];
      }
    }
    else{
      chatLength.value = 0;
      update();
      return [];
    }
  }




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController.addListener(() async{
      if( chatRoomInfo.value.totalPages > currentPage.value){
        if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
          ChatController.to.changeOpenLoading(3);
          await addRoomPage();
          ChatController.to.changeOpenLoading(0);
        }
      }
    });

  }


 @override
  void onClose() {
    // TODO: implement onClose
   scrollController.dispose();
    super.onClose();
  }

}