import 'package:banana_deal_by_monkeycompany/package/api/socket/socket_api/socket_api.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class SocketApiImpl implements SocketApi{
  const SocketApiImpl();

  @override
  void initSocket({
    required IO.Socket socket,
  }) {

    socket.connect();
    socket.onConnect((_) {

    });

    socket.on('join', (jo) {

    });


    socket.on('chat', (message) {

    });


    socket.on('leave', (data){

    });

  }

  @override
  Future<void> joinRoom({
    required IO.Socket socket,
    required String crIdx,
  }) async{
    await Future.delayed(const Duration(milliseconds: 200));
    socket.emit('join', {
      'C_room_idx' : crIdx,
      'C_type' : 'USER',
    });
  }

  @override
  Future<void> leaveRoom({
    required IO.Socket socket,
    required String crIdx,
  }) async{
    await Future.delayed(const Duration(milliseconds: 200));
    socket.emit('leave', {
      'C_room_idx' : crIdx,
      'C_type' : 'USER',
    });
  }


  @override
  Future<void> disConnectSocket({
    required IO.Socket socket,
  }) async{
    await Future.delayed(const Duration(milliseconds: 200));
    socket.disconnect();

  }

}