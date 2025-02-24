import 'package:banana_deal_by_monkeycompany/package/api/monkey/maker_kind/maker_kind_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/maker_kind/model/action/maker_kind_action.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/maker_kind_entity.dart';

class MakerKindApiImpl implements MakerKindApi {
  final MakerKindAction action;
  const MakerKindApiImpl({
    required this.action,
  });

  @override
  Future<List<MakerKindDto>> getMakerList({required String monkeyUrl}) async => await action.getMakerList(monkeyUrl);

}