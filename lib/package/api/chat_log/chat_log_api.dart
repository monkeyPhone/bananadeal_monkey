import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ChatLogApi {
  const ChatLogApi();

  Future<void> setImage({
    required List<ChatLogDtoRow> loadChats,
    required SharedPreferences mainPrefs,
  });

  Future<(bool, List<ChatLogDto>)> setCache({
    required List<ChatLogDtoRow> loadChats,
    required SharedPreferences mainPrefs,
    required String roomIdx,

  });

  Future<String> sendImage({
    required String imagePath,
    required String roomIdx,
    required DioRepository dio,
  });

  Future<List<String>> getImageList({
    required String roomIdx,
    required DioRepository dio,
    required CommonUrl url,
  });

  Future<bool> exitChat({
    required String roomIdx,
    required DioRepository dio,
  });


}