import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/chat_room_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/socket/socket_api/socket_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/socket/socket_rest_api/socket_rest_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/invite_store_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/socket_invite/socket_invite_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class SocketInviteRepositoryImpl implements SocketInviteRepository{
  final DioRepository dio;
  final ChatRoomApi chatRoomApi;
  final SocketRestApi socketRestApi;
  final SocketApi socketApi;
  final CommonUrl url;
  final String mName;
  final int mIdx;

  const SocketInviteRepositoryImpl({
    required this.dio,
    required this.chatRoomApi,
    required this.socketRestApi,
    required this.socketApi,
    required this.url,
    required this.mName,
    required this.mIdx,
  });

  @override
  Future<bool> sendInviteMulti({
    required bool isAll,
    required int diIdx,
    required String smMidList
  }) async{
    final List<InviteStoreVO> list = await socketRestApi.sendInvite(isAll: isAll, diIdx: diIdx, smMidList: smMidList, dio: dio, mName: mName);
    try{
      final DataDto roomDto = await chatRoomApi.getChatRoom(mIdx: mIdx, dio: dio);
      final List<ChatRoomVO> roomVOList = convertChatRoomVO(roomDto.data).where((e) => e.crStatus == 'NORMAL').toList();
      if(list.isNotEmpty && roomVOList.isNotEmpty){
        final IO.Socket socket = IO.io(url.bananaChat
            , <String, dynamic>{
              'transports': ['websocket'],
              'autoConnect': false,
              'query': {
                'userName': mName,
              }
            }
        );
        socketApi.initSocket(socket: socket);
        if(roomVOList.isNotEmpty){
          bool result = await _fetchAllInvite(data: list, roomList: roomVOList, mName: mName, socket: socket);
        }
        await socketApi.disConnectSocket(socket: socket);
      }
      return true;
    } catch(_){
      return false;
    }
  }


  Future<bool> _fetchAllInvite({
    required List<InviteStoreVO> data,
    required List<ChatRoomVO> roomList,
    required String mName,
    required IO.Socket socket,
  }) async{
    bool result = false;
    try{
      List<Future<void>> futures =
      List.generate(data.length, (int index) =>roomList.where((e) => e.smMId == data[index].smMId).isNotEmpty ? _inviteDeal(
          socket: socket,
          mName: mName,
          room: roomList.where((e) => e.smMId == data[index].smMId).first,
          dIdx: data[index].dIdx
      ) : Future.value()
      );
      await Future.wait(futures);
      result = true;
      return result;
    } catch(_){
      result = true;
      return result;
    }
  }


  Future<void> _inviteDeal({
    required IO.Socket socket,
    required String mName,
    required ChatRoomVO room,
    required int dIdx,
  }) async{
    await socketApi.joinRoom(socket: socket, crIdx: '${room.crIdx}');
    await _sendInvited(socket: socket, dIdx: dIdx, room: room, mName: mName,);
    await socketApi.leaveRoom(socket: socket, crIdx: '${room.crIdx}');
  }

  Future<void> _sendInvited({
    required IO.Socket socket,
    required ChatRoomVO room,
    required int dIdx,
    required String mName
  }) async{
    Map<String, dynamic> messagePost = {
      'C_room_idx' : room.crIdx,
      'C_message': 'SEND/DEAL/INVITATION/$dIdx',
      'C_type': 'USER',
      'token' : room.smToken,
      'C_name' : mName,
    };
    socket.emit('chat', messagePost);
  }


}