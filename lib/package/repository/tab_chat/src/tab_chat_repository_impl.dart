import 'package:banana_deal_by_monkeycompany/package/api/chat_connect/chat_connect_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/chat_room_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/tab_chat/tab_chat_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabChatRepositoryImpl implements TabChatRepository{
  final ChatConnectApi chatConnectApi;
  final ChatRoomApi chatRoomApi;
  final SharedPreferences mainPrefs;
  final DioRepository dio;
  const TabChatRepositoryImpl({
    required this.chatConnectApi,
    required this.chatRoomApi,
    required this.mainPrefs,
    required this.dio,
  });

  @override
  Future<bool> logTry({
    required ChatRoomVO room,
  }) async => await chatConnectApi.logTry(room: room, roomApi: chatRoomApi, mainPrefs: mainPrefs, dio: dio);

  @override
  Future<(bool, ChatRoomVO)> getChatRoomByIdx({required int mIdx, required String smId}) async => await chatConnectApi.getChatRoomByIdx(mIdx: mIdx, smId: smId, dio: dio);

}