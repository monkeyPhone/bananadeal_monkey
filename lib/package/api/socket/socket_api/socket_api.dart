import 'package:socket_io_client/socket_io_client.dart' as IO;

abstract class SocketApi {
  const SocketApi();

  void initSocket({
    required IO.Socket socket,
  });

  Future<void> joinRoom({
    required IO.Socket socket,
    required String crIdx,
  });

  Future<void> leaveRoom({
    required IO.Socket socket,
    required String crIdx,
  });

  Future<void> disConnectSocket({
    required IO.Socket socket,
  });

}