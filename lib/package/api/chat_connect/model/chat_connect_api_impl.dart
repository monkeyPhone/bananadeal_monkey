import 'package:banana_deal_by_monkeycompany/package/api/chat_connect/chat_connect_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_connect/model/action/chat_connect_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/chat_room_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatConnectApiImpl implements ChatConnectApi {
  final ChatConnectAction action;
  const ChatConnectApiImpl({
    required this.action,
  });

  @override
  Future<bool> logTry({
    required ChatRoomVO room,
    required ChatRoomApi roomApi,
    required SharedPreferences mainPrefs,
    required DioRepository dio,
  }) async => await action.logTry(room: room, mainPrefs: mainPrefs, roomApi: roomApi, dio: dio);


  @override
  Future<bool> createRoom({
    required int mIdx,
    required String smId,
    required String userMessage,
    required DioRepository dio,
  }) async => await  action.createRoom(mIdx: mIdx, smId: smId, userMessage: userMessage, dio: dio);

  @override
  Future<(bool, ChatRoomVO)> getChatRoomByIdx({
    required int mIdx,
    required String smId,
    required DioRepository dio,
  }) async => await action.getChatRoomByIdx(mIdx: mIdx, smId: smId, dio: dio);

}