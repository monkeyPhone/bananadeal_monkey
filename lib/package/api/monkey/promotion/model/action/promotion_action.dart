import 'dart:convert';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/create_deal/model/data/model_name_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/promotion/model/data/guyhap_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/promotion/model/data/walfare_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:dio/dio.dart';

class PromotionAction {
  const PromotionAction();

  final String _where = 'CreateDealPromotionAction';

  Future<(StatusEnum, List<String> maxInst, List<String> supportType, List<String> guyhap, List<String> walfare)> initInfo({
    required String tkIdx,
    required String psIdx,
    required CommonUrl url,
    required DioRepository dioRep
  }) async{

    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);

    try{
      if(tkIdx == '0'){
        return (StatusEnum.success, ['48개월', '36개월', '24개월', '12개월', '현금구매', '상관없음'], ['공시지원', '선택약정', '상관없음'], <String>[], <String>[]);
      }
      else{
        List<String> _maxInst = [];
        List<String> _supportType = ['공시지원', '선택약정', '상관없음'];
        List<String> _guyhap = [];
        List<String>_walfare = [];

        if(psIdx == '' || psIdx == '0'){
          _maxInst.addAll(['48개월', '36개월', '24개월', '12개월', '현금구매',  '상관없음']);
          List<WalfareDto> walFare = await _getWalfareList(dio: dio, url: url);
          _walfare.addAll(walFare.map((e) => e.pwName));
          _walfare.add('해당없음');

          GuyhapEntity guy =  await _getGuyhapList(dio: dio, tkIdx: tkIdx, url: url);
          if(guy.list.isNotEmpty){
            _guyhap.addAll(guy.list.map((e)=> e.gpProductName ?? ' '));
          }
          _guyhap.add('해당없음');
          return (StatusEnum.success, _maxInst, _supportType,_guyhap,_walfare);
        }

        else{
          List<ModelNameDto> model =  await _getPhoneModelNameList(tkIdx: int.parse(tkIdx), psIdx: int.parse(psIdx), dio: dio, url: url);
          if(model.first.mdIsHalbuMonth48 == 'Y'){
            _maxInst.addAll(['48개월', '36개월', '24개월', '12개월', '현금구매',  '상관없음']);
          } else {
            _maxInst.addAll(['36개월', '24개월', '12개월', '현금구매',  '상관없음']);
          }
          List<WalfareDto> walFare = await _getWalfareList(dio: dio, url: url);
          _walfare.addAll(walFare.map((e) => e.pwName));
          _walfare.add('해당없음');

          GuyhapEntity guy =  await _getGuyhapList(dio: dio, tkIdx: tkIdx, url: url);
          if(guy.list.isNotEmpty){
            _guyhap.addAll(guy.list.map((e)=> e.gpProductName!));
          }
          _guyhap.add('해당없음');
          return (StatusEnum.success, _maxInst, _supportType, _guyhap, _walfare);

        }

      }
    }
    catch(e){
      await dioRep.sendErrorLog(url: '몽키 경쟁 상태 api', dto: _where, errorContent: '$e');
      return (StatusEnum.error, <String>[], <String>[], <String>[], <String>[]);
    } finally {
      dio.close();
    }
  }

  Future<List<WalfareDto>> _getWalfareList({
    required Dio dio,
    required CommonUrl url,
  }) async {
    final String apiRoute = '${url.monkeyUrl}.monkeyphone.co.kr/_app/PopupWelfare/modeListData';
    var response =
    await dio.get(apiRoute);
    Map<String, dynamic> modelList = jsonDecode(response.data);
    WalfareEntity result = WalfareEntity.fromJson(modelList);
    return result.list;
  }

  Future<GuyhapEntity> _getGuyhapList({
    required Dio dio,
    required String tkIdx,
    required CommonUrl url,
  }) async {
    final String apiRoute = '${url.monkeyUrl}.monkeyphone.co.kr/_app/gyeolhab/modeListGyeolhap?tk_idx_mobile=$tkIdx';
    var response =
    await dio.get(apiRoute);
    Map<String, dynamic> modelList = jsonDecode(response.data);
    if(modelList["result"] == 'Y'){
      GuyhapEntity result = GuyhapEntity.fromJson(modelList);
      return result;
    }
    else{
      return GuyhapEntity(result: modelList["result"], list: []);
    }
  }


  Future<List<ModelNameDto>> _getPhoneModelNameList({
    required Dio dio,
    required int tkIdx, required int psIdx,
    required CommonUrl url,
  }) async {
    final String apiRoute = '${url.monkeyUrl}.monkeyphone.co.kr/_app/mobile/modeGetModelBySpecIdx?tk_idx=$tkIdx&ps_idx=$psIdx';

    var response =
    await dio.get(apiRoute);
    Map<String, dynamic> modelList = jsonDecode(response.data);
    ModelNameEntity model = ModelNameEntity.fromJson(modelList);
    return model.list;

  }

}