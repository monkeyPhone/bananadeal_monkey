abstract class SocketInviteRepository {
  const SocketInviteRepository();

  Future<bool> sendInviteMulti({
    required bool isAll,
    required int diIdx,
    required String smMidList
  });

}