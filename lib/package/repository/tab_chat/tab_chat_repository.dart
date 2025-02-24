import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';

abstract class TabChatRepository {
  const TabChatRepository();

  Future<bool> logTry({
    required ChatRoomVO room,
  });

  Future<(bool, ChatRoomVO)> getChatRoomByIdx({required int mIdx, required String smId});

}