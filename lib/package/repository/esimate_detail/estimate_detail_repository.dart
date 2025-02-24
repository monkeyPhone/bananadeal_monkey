import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';

abstract class EstimateDetailRepository {

  const EstimateDetailRepository();

  Future<(bool, ChatRoomVO)> getRoom({
    required int mIdx,
    required String smId,
  });
}