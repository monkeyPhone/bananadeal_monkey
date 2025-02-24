import 'package:banana_deal_by_monkeycompany/package/api/chat_room/chat_room_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/model/action/chat_room_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class ChatRoomApiImpl implements ChatRoomApi {
  final ChatRoomAction action;
  const ChatRoomApiImpl({
    required this.action,
  });

  @override
  Future<DataDto> getChatRoom({
    required int mIdx,
    required DioRepository dio,
  }) async =>
    await action.getChatRoom(dio: dio, mIdx: mIdx);

  @override
  Future<DataDto> getChatRoomByIdx({
    required DioRepository dio,
    required int mIdx,
    required String smMid,
  }) async => await action.getChatRoomByIdx(dio: dio, mIdx: mIdx, smMid: smMid);


  @override
  Future<DataDto> getChatRoomByIdxCreate({
    required DioRepository dio,
    required int mIdx,
    required String smMid,
    required String userMessage,
  }) async => await action.getChatRoomByIdxCreate(dio: dio, mIdx: mIdx, smMid: smMid, userMessage: userMessage);


  @override
  Future<DataDto> getChatLog({
    required String roomIdx,
    required String limit,
    required DioRepository dio,
  }) async => await action.getChatLog(dio: dio, roomIdx: roomIdx, limit: limit);

}