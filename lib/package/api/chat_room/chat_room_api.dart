import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class ChatRoomApi {
  const ChatRoomApi();

  Future<DataDto> getChatRoom({
    required int mIdx,
    required DioRepository dio,
  });

  Future<DataDto> getChatRoomByIdx({
    required DioRepository dio,
    required int mIdx,
    required String smMid,
  });

  Future<DataDto> getChatRoomByIdxCreate({
    required DioRepository dio,
    required int mIdx,
    required String smMid,
    required String userMessage,
  });

  Future<DataDto> getChatLog({
    required String roomIdx,
    required String limit,
    required DioRepository dio,
  });

}