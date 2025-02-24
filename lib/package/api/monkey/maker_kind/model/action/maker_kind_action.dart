import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/maker_kind_entity.dart';
import 'package:dio/dio.dart';

class MakerKindAction {
  const MakerKindAction();

  Future<List<MakerKindDto>> getMakerList(String monkeyUrl) async{
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    final String apiRoute = '$monkeyUrl.monkeyphone.co.kr/_app/phoneSpec/modeListPhoneMaker?showAllMaker=N';
    var response = await dio.get(apiRoute);
    Map<String, dynamic> makerList = jsonDecode(response.data);
    MakerKindEntity entity = MakerKindEntity.fromJson(makerList);
    entity.list.removeWhere((element) => element.mkName == '엘지' || element.mkName == "단말기 미구매" || element.mkName == "디바이스 단독");
    dio.close();
    return entity.list;
  }

}