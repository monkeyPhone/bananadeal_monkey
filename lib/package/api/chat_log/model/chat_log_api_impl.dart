import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/chat_log_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/action/chat_log_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatLogApiImpl implements ChatLogApi {
  final ChatLogAction action;

  const ChatLogApiImpl({
    required this.action,
  });

  @override
  Future<void> setImage({
    required List<ChatLogDtoRow> loadChats,
    required SharedPreferences mainPrefs,
  }) async => await action.setImage(mainPrefs: mainPrefs, loadChats: loadChats);

  @override
  Future<(bool, List<ChatLogDto>)> setCache({
    required List<ChatLogDtoRow> loadChats,
    required SharedPreferences mainPrefs,
    required String roomIdx,
  }) async => await action.setCache(mainPrefs: mainPrefs, roomIdx: roomIdx, loadChats: loadChats);

  @override
  Future<String> sendImage({
    required String imagePath,
    required String roomIdx,
    required DioRepository dio,
  }) async => await action.sendImage(dio: dio, imagePath: imagePath, roomIdx: roomIdx);

  @override
  Future<List<String>> getImageList({
    required String roomIdx,
    required DioRepository dio,
    required CommonUrl url,
  }) async => await action.getImageList(dio: dio, url: url, roomIdx: roomIdx);

  @override
  Future<bool> exitChat({
    required String roomIdx,
    required DioRepository dio,
  }) async => await action.exitChat(dio: dio, roomIdx: roomIdx);


}