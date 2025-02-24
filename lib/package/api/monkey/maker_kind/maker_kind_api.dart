import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/maker_kind_entity.dart';

abstract class MakerKindApi {
  const MakerKindApi();

  Future<List<MakerKindDto>> getMakerList({required String monkeyUrl});
}