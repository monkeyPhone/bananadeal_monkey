import 'package:banana_deal_by_monkeycompany/package/data/invite_store_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class SocketRestApi {
  const SocketRestApi();

  Future<List<InviteStoreVO>> sendInvite({
    required DioRepository dio,
    required String mName,
    required bool isAll,
    required int diIdx,
    required String smMidList,
  });

}