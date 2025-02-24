import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/package/api/monkey/maker_kind/maker_kind_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/maker_kind_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/mobile_data_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:dio/dio.dart';

class MobileDataAction {
  const MobileDataAction();

  Future<
      (StatusEnum statusEnum,
      List<MakerKindDto> makerList,
      List<MobileDataDto> mobileList)> initMobileData({
        required MakerKindApi makerKindApi,
        required String monkeyUrl,
        required String tkIdx,
      }) async{
    try{
      final List<MakerKindDto> makerList = await makerKindApi.getMakerList(monkeyUrl: monkeyUrl);
      final  List<MobileDataDto> mobileList = await getMobileData(tkIdx: tkIdx, monkeyUrl: monkeyUrl);
      return (StatusEnum.success, makerList, mobileList);

    } catch(_){
      return (StatusEnum.error, <MakerKindDto>[], <MobileDataDto>[]);
    }
  }


  Future<List<MobileDataDto>> getMobileData({
    required String tkIdx,
    required String monkeyUrl,
    String? keyword
  }) async
  {
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    final String apiRoute = switch(keyword){
      null => '$monkeyUrl.monkeyphone.co.kr/_app/mobile/modeListMobileBanana?tk_idx=$tkIdx',
      _ => '$monkeyUrl.monkeyphone.co.kr/_app/mobile/modeListMobileBanana?tk_idx=$tkIdx&FIND_KEYWORD=$keyword'
    };

    var response = await dio.get(apiRoute);
    Map<String, dynamic> data = jsonDecode(response.data);
    MobileDataEntity entity = MobileDataEntity.fromJson(data);
    dio.close();
    return entity.list;
  }


}