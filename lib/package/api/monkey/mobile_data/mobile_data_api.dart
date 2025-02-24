import 'package:banana_deal_by_monkeycompany/package/api/monkey/maker_kind/maker_kind_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/maker_kind_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/mobile_data_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class MobileDataApi {
  const MobileDataApi();

  Future<
      (StatusEnum statusEnum,
      List<MakerKindDto> makerList,
      List<MobileDataDto> mobileList)> initMobileData({
    required MakerKindApi makerKindApi,
    required String monkeyUrl,
    required String tkIdx,
  });


  Future<List<MobileDataDto>> getMobileData({
    required String tkIdx,
    required String monkeyUrl,
    String? keyword
  });

}