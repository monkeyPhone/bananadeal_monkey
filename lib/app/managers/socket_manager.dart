import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/app_outs/data/socket_deal_status.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/main/auth/auth_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/chat_service_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_user_room_list.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../modules/src/src_components/controllers/src_info_controller.dart';
import '../routes/const/const_info.dart';

enum SocketEnum {
  leave, accept, invite
}

class SocketManger{
  
  Future<IO.Socket> initSocket() async{
    final IO.Socket socket = IO.io(ApiConsole.chatServer
        , <String, dynamic>{
          'transports': ['websocket'],
          'autoConnect': false,
          'query': {
            'userName': SrcInfoController.to.infoM.value.mName,
          }
        }
    );
    socket.connect();
    socket.onConnect((_) {

    });

    socket.on('join', (jo) {

    });


    socket.on('chat', (message) {

    });


    socket.on('leave', (data){

    });


    await Future.delayed(Duration(milliseconds: 100));
    return socket;
  }

  Future<void> socketDisconnect(IO.Socket socket) async{
      Timer(
         Duration(milliseconds: 300),
        (){
        socket.disconnect();
        print('safesocketis disConnect');
      }
    );

  }


  Future<bool> joinRoom({
    required IO.Socket socket,
    required String mName,
    required SocketEnum socketEnum,
    required RoomList room,
    required int dIdx,
  }) async {
    try {
      await Future.delayed(Duration(milliseconds: 100));
      switch(socketEnum){
        case SocketEnum.invite:
          await sendInvited(mName: mName, socket: socket, dIdx: dIdx, room: room);
        case SocketEnum.accept:
          await sendAccept(mName: mName, room: room, socket: socket);
        case SocketEnum.leave:
          await sendLeave(room: room, mName: mName, socket: socket);
      }
      return true;
    }catch(_){
      return false;
    }
  }

  Future<void> sendInvited({
    required String mName,
    required IO.Socket socket,
    required int dIdx,
    required RoomList room
  }) async{
    var messagePost = {
      'C_room_idx' : '${room.crIdx}',
      'C_message': 'SEND/DEAL/INVITATION/$dIdx',
      'C_type': 'USER',
      'token' : room.smToken,
      'C_name' : mName,
    };
    socket.emit('chat', messagePost);
  }

  Future<void> sendAccept({
    required String mName,
    required RoomList room,
    required IO.Socket socket,
  }) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? reservation = prefs.getString(InfoString.saveReservation);
    Get.back();
    Get.back();
    if(room.crIdx == -1){
      await socketDisconnect(socket);
      Future.delayed(Duration(milliseconds: 200));
      await ChatServiceController.to.createChat2(crSmid: room.smMId, context: Get.context!, message: 'SEND/DEAL/ACCEPT$reservation', smName: room.smStoreName);
    }
    else{
      socket.emit('join', {
        'C_room_idx' : '${room.crIdx}',
        'C_type' : 'USER',
      });

      var messagePost = {
        'C_room_idx' : '${room.crIdx}',
        'C_message': 'SEND/DEAL/ACCEPT$reservation',
        'C_type': 'USER',
        'token' : room.smToken,
        'C_name' : mName,
      };
      socket.emit('chat', messagePost);
      Timer(Duration(milliseconds: 200), () async{
        await prefs.remove(InfoString.saveReservation);
        await Future.delayed(Duration(milliseconds: 300));
        Get.back();
        Get.back();
        await ChatServiceController.to.createChat2(crSmid: room.smMId, context: Get.context!, message: '',
            smName: room.smStoreName
        );
      });
    }
  }

  Future<void> codeLeave({
    required String crIdx,
    required IO.Socket socket,
    required bool isMulti,
  }) async{
   if(crIdx != '-1'){
     await Future.delayed(Duration(milliseconds: 150));
     socket.emit('leave', {
       'C_room_idx' : crIdx,
     });
   }
    if(!isMulti){
      await Future.delayed(Duration(milliseconds: 150));
      await socketDisconnect(socket);
    }
  }

  Future<void> sendLeave({
    required RoomList room,
    required String mName,
    required IO.Socket socket,
}) async{
    var messagePost = {
      'C_room_idx' : '${room.crIdx}',
      'C_message': '$mName님이 채팅을 종료했어요',
      'C_type': 'USER',
      'token' : room.smToken,
      'C_name' : mName,
    };
    socket.emit('chat', messagePost);
      Timer(Duration(milliseconds: 200), () async{
      AuthController.to.deleteChat('${room.crIdx}');
    });
  }


}


class SocketRepository {
  const SocketRepository();

  Future<List<SocketDeal>> getDealListByIdx({
    required int mIdx,
    required String smId,
  }) async {
    final String apiRoute = '${ApiConsole.bananaPrivateUrl}/deal/list/byidx';

    final Map<String, dynamic> data = await DioServiceManager(options: ApiConsole().options).getData(
        apiRoute: apiRoute,
        repo: 'SocketManger',
        router505: 'main',
        form:   {
          "DI_reg_user_idx": mIdx,
          "D_sm_m_id": smId,
        }
    );

    final SocketDealStatus deal = SocketDealStatus.fromJson(data);
    final List<SocketDeal> list = deal.result;
    return list;
  }

  Future<RoomList> getRoomByIdxSMid({
    required int mIdx,
    required String smId,
    required String storeName,
  }) async {
    final String apiRoute = '${ApiConsole.bananaPrivateUrl}/room/list/byidx/smid/new';

    final Map<String, dynamic> data = await DioServiceManager(options: ApiConsole().options).getData(
        apiRoute: apiRoute,
        repo: 'SocketManger',
        router505: 'main',
        form:   {
          "M_idx": mIdx,
          "SM_m_id": smId,
        }
    );

    final ChatUserRoomList room = ChatUserRoomList.fromJson(data);
    final List<RoomList> list = room.result;
    if(list.where((e) => e.crStatus == 'NORMAL').isNotEmpty){
      return list.firstWhere((e) => e.crStatus == 'NORMAL');
    }
    else{
      return RoomList(crIdx: -1,
          smMId: smId,
          smIsShow: '',
          crStatus: '',
          smStoreName: storeName,
          smTel: '',
          smAddress: '',
          smPathImg0: '',
          lastMessage: '',
          lastMessageTime: '',
          cIsRead: 0,
          isDealing: 0,
          smToken: '',
          smLatitude: '',
          smLongitude: '');
    }

  }

}