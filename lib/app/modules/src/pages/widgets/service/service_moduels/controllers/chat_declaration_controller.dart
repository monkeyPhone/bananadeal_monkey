import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/socket_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_user_room_list.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:image_cropper/image_cropper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../components/common_widgets.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../managers/device_manager.dart';
import '../../../../../../../models/auth_basic_api.dart';
import '../../../../../../../repository/bdbot/bd_bot_nav_rapository.dart';
import '../../../../../../../repository/chat/chat_service_repository.dart';
import '../../../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_chat_controller.dart';
import '../../../../../src_components/controllers/src_route_controller.dart';
import '../../../../chat/controllers/chat_controller.dart';

class ChatDeclarationController extends GetxController{
  static ChatDeclarationController get to => Get.find();

  final BdBotNavRepository _bdBotNavRepository = const RegisterManager().getBdBotNavRepository();
  final ChatServiceRepository _chatServiceRepository = const RegisterManager().getChatServiceRepository();
  final CommonWidgets commonWidgets = CommonWidgets();
  final Rx<RoomList> roomList = RoomList(
      crIdx: 0, smMId: '', smIsShow: '', crStatus: '',
      smStoreName: '', smTel: '', smAddress: '',
      smPathImg0: '', lastMessage: '',
      lastMessageTime: '', cIsRead: 0,
      isDealing: 0, smToken: '',
      smLatitude: '',
      smLongitude: ''
  ).obs;
  final RxString text = ''.obs;
  final RxString type = ''.obs;

  RxDouble deviceHeight = WidgetSize(Get.context!).height60px.obs;




  var dropdownValue = ''.obs;


  RxString declarationInput = ''.obs;

  void inputDeclaration(val) {
    declarationInput.value = val;
  }

  RxList<CroppedFile?> imagePath = <CroppedFile?>[null,null,null].obs;

  double imageSize = WidgetSize(Get.context!).sizedBox121;


  List<String> items = ['욕설 또는 폭력적인 표현을 사용해요','음란한 표현을 사용해요','사행성을 조장해요','허위적인 내용을 다루고 있어요','다른 문제가 있어요'];





  void switchRouteCaseUpload(int index){
    switch(index){
      case 0:
        SrcRouteController.to.gotoUpload('decChat $index');
        break;
      case 1:
        SrcRouteController.to.gotoUpload('decChat $index');
        break;
      case 2:
        SrcRouteController.to.gotoUpload('decChat $index');
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
    dropdownValue.value = '';
    declarationInput.value = '';
    declarationNoti.value = 0;
    imagePath.value = <CroppedFile?>[null, null, null];
  }

  RxInt declarationNoti = 0.obs;

  Future<void> postDeclaration({
    required int bruMidx, required String bruType, required String bruMidxPe,
    required String bruSmMid, required String bruTitle, required String bruContent, required String bruRoomIdx,
    required String bruPathImageEdit1, required String bruPathImageEdit2, required String bruPathImageEdit3,
    required String smName, required int crIdx
  }) async{
    final String result = DeviceManager.emojiConvert(bruContent);
    declarationNoti.value = 20;
    AuthBagicApi api = await _bdBotNavRepository.userReportCreate(
        bruMidx: bruMidx, bruType: bruType, bruMidxPe: bruMidxPe,
        bruRuIdx: bruRoomIdx,
        bruSmMid: bruSmMid, bruTitle: bruTitle, bruContent: result,
        bruPathImageEdit1: bruPathImageEdit1, bruPathImageEdit2: bruPathImageEdit2, bruPathImageEdit3: bruPathImageEdit3);
    if(api.status == 200){
      declarationNoti.value = 30;
      initDeclaration();
      AuthBagicApi retry = await _chatServiceRepository.roomLeave(
          crMidx: crIdx,
          );
      if(retry.status == 200)
      {
        final IO.Socket socketIo = await SocketManger().initSocket();
        try{
          try{
            bool result = await SocketManger().joinRoom(
              mName: SrcInfoController.to.infoM.value.mName,
              socket: socketIo, socketEnum: SocketEnum.leave, room: roomList.value, dIdx: 0,
            );
            if (!result) {
              await Future.delayed(Duration(seconds: 1));
              await SocketManger().joinRoom(
                mName: SrcInfoController.to.infoM.value.mName,
                socket: socketIo, socketEnum: SocketEnum.leave, room: roomList.value, dIdx: 0,
              );// 잠시 대기 후 재시도
            }
          } catch(_){
            try{
              await SocketManger().joinRoom(
                mName: SrcInfoController.to.infoM.value.mName,
                socket: socketIo, socketEnum: SocketEnum.leave, room: roomList.value, dIdx: 0,
              );
            } catch(_){

            }
          }

          await SocketManger().codeLeave(crIdx: '${roomList.value.crIdx}', socket: socketIo, isMulti: false);
          BdBotNavChatController.to.notiUpdate();
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.remove('${roomList.value.crIdx}');
          await prefs.reload();
          Get.back();
          commonWidgets.customSnackbar('채팅방에서 퇴장하셨습니다.');
          commonWidgets.customSnackbar('신고가 완료되었어요.');
        } catch(_){
          await SocketManger().codeLeave(crIdx: '${roomList.value.crIdx}', socket: socketIo, isMulti: false);
          BdBotNavChatController.to.notiUpdate();
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.remove('${roomList.value.crIdx}');
          await prefs.reload();
          Get.back();
          commonWidgets.customSnackbar('채팅방에서 퇴장하셨습니다.');
          commonWidgets.customSnackbar('신고가 완료되었어요.');
        }
        //TODO 채팅 보내게 방법 생각하기

      }


    } else {
      if(api.status < 500){
        declarationNoti.value = 0;
        commonWidgets.customSnackbar('이전 신고내용이 처리중입니다.');
      } else{

      }
    }
  }



  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    deviceHeight.value = await DeviceManager.getDeviceHeight();

    text.value = '매장과의 채팅 내용을 신고하시겠어요?';
    type.value = 'CHAT';
    if(ChatController.to.declaList.isEmpty){
      Get.back();
    }
    else{
      roomList.value = ChatController.to.declaList.first;
    }

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

}