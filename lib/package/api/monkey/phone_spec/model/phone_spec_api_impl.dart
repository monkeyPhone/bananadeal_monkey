import 'package:banana_deal_by_monkeycompany/package/api/monkey/maker_kind/maker_kind_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/phone_spec/model/action/phone_spec_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/phone_spec/phone_spec_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/maker_kind_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class PhoneSpecApiImpl implements PhoneSpecApi {
  final PhoneSpecAction action;
  const PhoneSpecApiImpl({
    required this.action,
  });

  @override
  Future<
      (StatusEnum statusEnum,
      List<MakerKindDto> makerList,
      (List<PhoneSpecDto> samsung, List<PhoneSpecDto> apple, List<PhoneSpecDto> etc) specList,
      )> initPhoneSpec({
    required MakerKindApi makerKindApi,
    required String monkeyUrl,
  }) async => await action.initPhoneSpec(makerKindApi: makerKindApi, monkeyUrl: monkeyUrl);


  @override
  Future<List<PhoneSpecDto>> getPhoneSpec({
    String? mkIdx,
    String? keyword,
    required String monkeyUrl,
  }) async => await action.getPhoneSpec(
      mkIdx: mkIdx,
      keyword: keyword
      ,monkeyUrl: monkeyUrl
  ) ;

}