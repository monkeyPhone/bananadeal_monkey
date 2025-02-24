import 'package:banana_deal_by_monkeycompany/package/api/chat_connect/chat_connect_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/esimate_detail/estimate_detail_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class EstimateDetailRepositoryImpl implements EstimateDetailRepository {
  final ChatConnectApi chatConnectApi;
  final DioRepository dio;
  const EstimateDetailRepositoryImpl({
    required this.chatConnectApi,
    required this.dio,
  });

  @override
  Future<(bool, ChatRoomVO)> getRoom({
    required int mIdx,
    required String smId,
  }) async => await chatConnectApi.getChatRoomByIdx(mIdx: mIdx, smId: smId, dio: dio);
}