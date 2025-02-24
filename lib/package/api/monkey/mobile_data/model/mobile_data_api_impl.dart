import 'package:banana_deal_by_monkeycompany/package/api/monkey/maker_kind/maker_kind_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/mobile_data/mobile_data_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/mobile_data/model/action/mobile_data_action.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/maker_kind_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/mobile_data_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class MobileDataApiImpl implements MobileDataApi {
  final MobileDataAction action;
  const MobileDataApiImpl({
    required this.action,
  });

  @override
  Future<
      (StatusEnum statusEnum,
      List<MakerKindDto> makerList,
      List<MobileDataDto> mobileList)> initMobileData({
    required MakerKindApi makerKindApi,
    required String monkeyUrl,
    required String tkIdx,
  }) async => await action.initMobileData(makerKindApi: makerKindApi, monkeyUrl: monkeyUrl, tkIdx: tkIdx);


  @override
  Future<List<MobileDataDto>> getMobileData({
    required String tkIdx,
    required String monkeyUrl,
    String? keyword
  }) async => await action.getMobileData(tkIdx: tkIdx, monkeyUrl: monkeyUrl, keyword: keyword);

}