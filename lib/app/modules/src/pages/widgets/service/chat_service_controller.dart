import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/controllers/chat_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_user_room_list.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../../components/common_widgets.dart';
import '../../../../../models/auth_basic_api.dart';
import '../../../../../repository/chat/chat_service_repository.dart';
import '../../../../main/loading/loading_controller.dart';
import '../../../src_components/controllers/src_info_controller.dart';


class ChatServiceController extends GetxController {
  static ChatServiceController get to => Get.find();


  final ChatServiceRepository _chatServiceRepository;
  final CommonWidgets _commonWidgets;

  ChatServiceController({
    required ChatServiceRepository chatServiceRepository,
    required CommonWidgets commonWidgets,
  }) : _chatServiceRepository = chatServiceRepository,
       _commonWidgets = commonWidgets;


  createChat2({required crSmid, required context, required String message, required String smName}) async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      AuthBagicApi api = await LoadingController.to.apiLoadings(
         future: _chatServiceRepository.createChatRoom(crMidx: SrcInfoController.to.infoM.value.mIdx.toString(), crSmMid: crSmid, userMessage: message),
        text: Style.dataMent
      );
      ChatUserRoomList roomList = await _chatServiceRepository.getRoomByIdx(crIdx: api.result.first,);
      if(api.status == 200 && roomList.status == 200){
        _commonWidgets.customSnackbar('채팅방이 생성되었어요');
        await ChatController.to.logTry(room: roomList.result.first);
      }
      else{
        //채팅방 열기로 바꾸기
        if(api.status == 404 && roomList.status == 200){
          _commonWidgets.customSnackbar('$smName 채팅을 시작합니다.');
          await ChatController.to.logTry(room: roomList.result.first);
        }
        else{
          _commonWidgets.customSnackbar('채팅 연결에 실패 했어요');
        }
      }
    }
  }

}