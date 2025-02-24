import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/chat_log_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/chat_room_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/chat_log/chat_log_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatLogRepositoryImpl implements ChatLogRepository{
  final ChatLogApi api;
  final ChatRoomApi roomApi;
  final SharedPreferences mainPrefs;
  final String roomIdx;
  final DioRepository dio;
  final CommonUrl url;
  const ChatLogRepositoryImpl({
    required this.api,
    required this.roomApi,
    required this.mainPrefs,
    required this.roomIdx,
    required this.dio,
    required this.url,
  });

  @override
  Future<void> setImage({
    required List<ChatLogDtoRow> loadChats,
  }) async => await api.setImage(loadChats: loadChats, mainPrefs: mainPrefs);


  @override
  Future<(bool, List<ChatLogDto>)> setCache({
    required List<ChatLogDtoRow> loadChats,
  }) async => await api.setCache(loadChats: loadChats, mainPrefs: mainPrefs, roomIdx: roomIdx);

  @override
  Future<DataDto> getChatLog({
    required String limit
  }) async => await roomApi.getChatLog(roomIdx: roomIdx, limit: limit, dio: dio);
  
  @override
  Future<String> sendImage({
    required String imagePath,

  }) async => await api.sendImage(imagePath: imagePath, roomIdx: roomIdx, dio: dio);

  @override
  Future<List<String>> getImageList() async => await api.getImageList(roomIdx: roomIdx, dio: dio, url: url);

  @override
  Future<bool> exitChat() async => await api.exitChat(roomIdx: roomIdx, dio: dio);

}