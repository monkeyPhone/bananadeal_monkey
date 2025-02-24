import 'package:banana_deal_by_monkeycompany/package/api/chat_room/chat_room_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ChatConnectApi {
  const ChatConnectApi();

  Future<bool> logTry({
    required ChatRoomVO room,
    required ChatRoomApi roomApi,
    required SharedPreferences mainPrefs,
    required DioRepository dio,
  });


  Future<bool> createRoom({
    required int mIdx,
    required String smId,
    required String userMessage,
    required DioRepository dio,
  });

  Future<(bool, ChatRoomVO)> getChatRoomByIdx({
    required int mIdx,
    required String smId,
    required DioRepository dio,
  });

}