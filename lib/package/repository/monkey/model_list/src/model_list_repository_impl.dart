import 'package:banana_deal_by_monkeycompany/package/api/monkey/maker_kind/maker_kind_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/mobile_data/mobile_data_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/phone_spec/phone_spec_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/maker_kind_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/mobile_data_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/model_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/model_list/model_list_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class ModelListRepositoryImpl implements ModelListRepository{
  final PhoneSpecApi phoneSpecApi;
  final MobileDataApi mobileDataApi;
  final MakerKindApi makerKindApi;
  final String monkeyUrl;
  const ModelListRepositoryImpl({
    required this.phoneSpecApi,
    required this.makerKindApi,
    required this.mobileDataApi,
    required this.monkeyUrl,
  });

  @override
  Stream <ModelListVO> initModelList(String tkIdx) => Stream.fromFuture(_initModelList(tkIdx));

  @override
  Future<List<PhoneSpecDto>> getPhoneSpec({
    String? mkIdx,
    String? keyword,
  }) async => await phoneSpecApi.getPhoneSpec(monkeyUrl: monkeyUrl, mkIdx: mkIdx, keyword: keyword);

  @override
  Future<List<MobileDataDto>> getMobileData({
    required String tkIdx,
    String? keyword
  }) async => await mobileDataApi.getMobileData(tkIdx: tkIdx, monkeyUrl: monkeyUrl, keyword: keyword);

  Future<ModelListVO> _initModelList(String tkIdx) async{
    if(tkIdx == '0'){
      final (StatusEnum statusEnum,
      List<MakerKindDto> makerList,
      (List<PhoneSpecDto> samsung, List<PhoneSpecDto> apple, List<PhoneSpecDto> etc) specList,
      ) spec = await phoneSpecApi.initPhoneSpec(makerKindApi: makerKindApi, monkeyUrl: monkeyUrl);
      final ModelListVO result = ModelListVO(
          statusEnum: spec.$1,
          makerList: spec.$2,
          specList: SpecListVO(samsung: spec.$3.$1, apple: spec.$3.$2, etc: spec.$3.$3),
          mobileList: <MobileDataDto>[]
      );
      return result;
    }
    else{
      final ( StatusEnum statusEnum,
              List<MakerKindDto> makerList,
              List<MobileDataDto> mobileList
      ) mobile = await mobileDataApi.initMobileData(makerKindApi: makerKindApi, monkeyUrl: monkeyUrl, tkIdx: tkIdx);
      final ModelListVO result = ModelListVO(
        statusEnum: mobile.$1,
        makerList: mobile.$2,
        specList: const SpecListVO(samsung: [], apple: [], etc: []),
        mobileList: mobile.$3
      );
      return result;
    }
  }

}