import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/mobile_data_by_ps_idx_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_group_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:dio/dio.dart';

class PlanAction{
  const PlanAction();

  Future<PlanVO> getRatePlan({
    required String tkIdx, required String psIdx, required String monkeyUrl, required DioRepository dioRep,
  }) async{
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try{
      List<PlanGroupDto> name = await _getRatePlanName(dio: dio, tkIdx: tkIdx, monkeyUrl: monkeyUrl);
      List<PlanGroupDto> resultName = [];
      if(psIdx == ''){
        List<PlanDto> plan = await _getRatePlanKeyword(dio: dio, tkIdx: tkIdx, monkeyUrl: monkeyUrl);
        resultName.addAll(name.where(
                (e) => plan.where((element)=> element.pgName!.contains(e.pgName)).isNotEmpty
        ));
        final PlanVO result = PlanVO(
            statusEnum: plan.isNotEmpty && name.isNotEmpty ? StatusEnum.success : StatusEnum.error,
            planGroup: resultName,
            planList: plan
        );
        return result;
      } else {
        MobileDataByPsIdxEntity model = await _getMobileDataByPsIdx(dio: dio, tkIdx: tkIdx, psIdx: psIdx, monkeyUrl: monkeyUrl);
        List<PlanDto> plan2 = await _getRatePlanMobileKeyword(dio: dio, tkIdx: tkIdx, mdModel: model.list.first.mdModel, monkeyUrl: monkeyUrl);
        resultName.addAll(name.where(
                (e) => plan2.where((element)=> element.pgName!.contains(e.pgName)).isNotEmpty
        ));
        final PlanVO result = PlanVO(
            statusEnum: plan2.isNotEmpty && name.isNotEmpty ? StatusEnum.success : StatusEnum.error,
            planGroup: resultName,
            planList: plan2
        );
        return result;

      }

    } catch(e){
        dioRep.sendErrorLog(url: 'Monkey RateList MultiApi', dto: 'PlanAction', errorContent: '$e');
        const PlanVO result = PlanVO(
            statusEnum: StatusEnum.exception,
            planGroup: [],
            planList: []
        );
      return result;
    } finally {
      dio.close();
    }
  }


  Future<List<PlanGroupDto>> _getRatePlanName({
    required Dio dio,
    required String tkIdx,
    required String monkeyUrl
  }) async {
    final String apiRoute = '$monkeyUrl.monkeyphone.co.kr/_app/plan/modeListYogumGroup?tk_idx=$tkIdx';
    var response = await dio.get(apiRoute);
    Map<String, dynamic> data = jsonDecode(response.data);
    PlanGroupEntity entity = PlanGroupEntity.fromJson(data);
    List<String> banList = ["신규가입불가", "2G, 3G 전용", "T포켓파이", "3G 전용", "에그", "라우터", "USIM", "3G전용"];
    entity.list.removeWhere((element) => banList.contains(element.pgName));
    return entity.list;
  }


  Future<List<PlanDto>> _getRatePlanKeyword({
    required Dio dio,
    required String tkIdx,
    required String monkeyUrl,
    String? keyword
  }) async {
    final String apiRoute =
    keyword == null ? '$monkeyUrl.monkeyphone.co.kr/_app/plan/modeListPlanYogum?tk_idx=$tkIdx'
        : '$monkeyUrl.monkeyphone.co.kr/_app/plan/modeListPlanYogum?tk_idx=$tkIdx&FIND_KEYWORD=$keyword';
    var response =
    await dio.get(apiRoute);
    Map<String, dynamic> data = jsonDecode(response.data);
    PlanEntity entity = PlanEntity.fromJson(data);
    if(entity.rateList != null){
      for(var i = 0; i< entity.rateList!.length; i++){
        final int price = int.parse(entity.rateList![i].pPlanPrice!);
        final double vat = int.parse(entity.rateList![i].pPlanPrice!)*0.1;
        final int v = vat.floor();
        final int priceVat = price+v;
        final double priceV = priceVat*0.1;
        final int priceF = priceV.floor();
        final int priceR = priceF*10;
        entity.rateList![i].pPlanPrice = priceR.toString();
      }
      entity.rateList!.removeWhere((element) => element.pType == "USIM");
    }
    return entity.rateList!;
  }


  Future<MobileDataByPsIdxEntity> _getMobileDataByPsIdx({
    required Dio dio,
    required String tkIdx,
    required String psIdx,
    required String monkeyUrl,
  }) async {
    final String apiRoute = '$monkeyUrl.monkeyphone.co.kr/_app/mobile/modeGetModelBySpecIdx?tk_idx=$tkIdx&ps_idx=$psIdx';
    var response =
    await dio.get(apiRoute);
    Map<String, dynamic> data = jsonDecode(response.data);
    MobileDataByPsIdxEntity entity = MobileDataByPsIdxEntity.fromJson(data);
    return entity;
  }


  Future<List<PlanDto>> _getRatePlanMobileKeyword({
    required Dio dio,
    required String tkIdx, required String mdModel,
    String? keyword,
    required String monkeyUrl
  }) async {
    final String apiRoute =
    keyword == null ? '$monkeyUrl.monkeyphone.co.kr/_app/plan/modeListPlanYogum_mobile?tk_idx=$tkIdx&md_model=$mdModel'
        : '$monkeyUrl.monkeyphone.co.kr/_app/plan/modeListPlanYogum_mobile?tk_idx=$tkIdx&md_model=$mdModel&FIND_KEYWORD=$keyword';

    var response =
    await dio.get(apiRoute);
    Map<String, dynamic> data = jsonDecode(response.data);
    PlanEntity entity = PlanEntity.fromJson(data);
    if(entity.rateList != null){
      for(var i = 0; i<entity.rateList!.length; i++){
        final int price = int.parse(entity.rateList![i].pPlanPrice!);
        final double vat = int.parse(entity.rateList![i].pPlanPrice!)*0.1;
        final int v = vat.floor();
        final int priceVat = price+v;
        final double priceV = priceVat*0.1;
        final int priceF = priceV.floor();
        final int priceR = priceF*10;
        entity.rateList![i].pPlanPrice = priceR.toString();
      }
    }
    return entity.rateList!;


  }


  Future<List<PlanDto>> getRatePlanSearch({
    required String tkIdx,
    required String psIdx,
    required String keyword,
    required String monkeyUrl,
    required DioRepository dioRep
  }) async {
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try{
      if(psIdx == ''){
        List<PlanDto> plan = await _getRatePlanKeyword(dio: dio, tkIdx: tkIdx, keyword: keyword, monkeyUrl: monkeyUrl);
        return plan;
      }
      else{
        MobileDataByPsIdxEntity model = await _getMobileDataByPsIdx(dio: dio, tkIdx: tkIdx, psIdx: psIdx, monkeyUrl: monkeyUrl);
        List<PlanDto> plan = await _getRatePlanMobileKeyword(dio: dio, tkIdx: tkIdx, mdModel: model.list.first.mdModel, keyword: keyword, monkeyUrl: monkeyUrl);
        return plan;
      }
    } catch(e){
      dioRep.sendErrorLog(url: 'Monkey RateList MultiApi', dto: 'PlanAction', errorContent: '$e');
      return [];
    } finally{
      dio.close();
    }

  }


}