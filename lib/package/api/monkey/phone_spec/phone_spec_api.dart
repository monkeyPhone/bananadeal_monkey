import 'package:banana_deal_by_monkeycompany/package/api/monkey/maker_kind/maker_kind_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/maker_kind_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class PhoneSpecApi {
  const PhoneSpecApi();

  Future<
      (StatusEnum statusEnum,
      List<MakerKindDto> makerList,
      (List<PhoneSpecDto> samsung, List<PhoneSpecDto> apple, List<PhoneSpecDto> etc) specList,
      )> initPhoneSpec({
    required MakerKindApi makerKindApi,
    required String monkeyUrl
  });


  Future<List<PhoneSpecDto>> getPhoneSpec({
    String? mkIdx,
    String? keyword,
    required String monkeyUrl,
  });

}