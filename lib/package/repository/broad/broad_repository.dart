import 'package:banana_deal_by_monkeycompany/package/data/broad/deal_info_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class BroadRepository {
  const BroadRepository();

  Stream<DealInfoDto> streamInitData();

  Future<StatusEnum> updateUser({
    required Map<String, dynamic> dataMap,
  });


}