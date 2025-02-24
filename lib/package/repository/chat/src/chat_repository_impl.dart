import 'package:banana_deal_by_monkeycompany/package/api/chat_room/chat_room_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/chat/chat_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRoomApi api;
  final int mIdx;
  final DioRepository dio;
  const ChatRepositoryImpl({
    required this.api,
    required this.dio,
    required this.mIdx,
  });

  @override
  Stream<DataDto> streamVO() => Stream.fromFuture(api.getChatRoom(mIdx: mIdx, dio: dio));
}