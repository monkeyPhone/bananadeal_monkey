import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';

abstract class ChatLogRepository {
  const ChatLogRepository();

  Future<void> setImage({
    required List<ChatLogDtoRow> loadChats,
  });


  Future<(bool, List<ChatLogDto>)> setCache({
    required List<ChatLogDtoRow> loadChats,
  });

  Future<DataDto> getChatLog({
    required String limit
  });

  Future<String> sendImage({
    required String imagePath,
  });

  Future<List<String>> getImageList();

  Future<bool> exitChat();

}
