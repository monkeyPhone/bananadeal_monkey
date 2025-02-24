import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/package/api/monkey/maker_kind/maker_kind_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/maker_kind_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:dio/dio.dart';

class PhoneSpecAction {
  const PhoneSpecAction();

  Future<
      (StatusEnum statusEnum,
      List<MakerKindDto> makerList,
      (List<PhoneSpecDto> samsung, List<PhoneSpecDto> apple, List<PhoneSpecDto> etc) specList,
     )> initPhoneSpec({
      required MakerKindApi makerKindApi,
      required String monkeyUrl,
     }) async{
    try{
      final List<MakerKindDto> makerList = await makerKindApi.getMakerList(monkeyUrl: monkeyUrl);
      final List<PhoneSpecDto> samsung = await getPhoneSpec(mkIdx: '1', monkeyUrl: monkeyUrl);
      final List<PhoneSpecDto> apple = await getPhoneSpec(mkIdx: '3', monkeyUrl: monkeyUrl);
      final List<PhoneSpecDto> etc = await getPhoneSpec(mkIdx: '4', monkeyUrl: monkeyUrl);

      return (StatusEnum.success, makerList, (samsung, apple, etc));

    } catch(_){
      return (StatusEnum.error, <MakerKindDto>[],(<PhoneSpecDto>[],<PhoneSpecDto>[],<PhoneSpecDto>[]));
    }
  }


  Future<List<PhoneSpecDto>> getPhoneSpec({
    String? mkIdx,
    String? keyword,
    required String monkeyUrl
  }) async {
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    final String apiRoute = switch(mkIdx){
      null => '$monkeyUrl.monkeyphone.co.kr/_app/phoneSpec/modeListPhoneSpecBanana?FIND_KEYWORD=$keyword&SORT_BY=PS_order&SORT=DESC',
      _ => '$monkeyUrl.monkeyphone.co.kr/_app/phoneSpec/modeListPhoneSpecBanana?mk_idx=$mkIdx&SORT_BY=PS_order&SORT=DESC'
    };
    var response =
    await dio.get(apiRoute);
    Map<String, dynamic> data = jsonDecode(response.data);
    PhoneSpecEntity entity = PhoneSpecEntity.fromJson(data);
    dio.close();
    return entity.list;
  }

}