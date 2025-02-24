import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/create_deal/model/data/model_name_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/api/create_deal/model/data/rate_plan_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:dio/dio.dart';

class CreateDealAction {
  const CreateDealAction();

  final String _where = 'CreateDealApi_CreateDealAction';

  Future<bool> checkValue({
    required int tkIdx,
    required int psIdx,
    required CommonUrl url,
    required DioRepository dioRep,
  }) async{
    try{
      final List<ModelNameDto> nameList = await _getPhoneModelName(tkIdx: tkIdx, psIdx: psIdx, url: url, dioRep: dioRep);
      if(nameList.isNotEmpty){
        final List<RatePlanDto>? rateList = await _getRatePlanMobile(tkIdx: tkIdx, mdModel: nameList.first.mdModel, url: url, dioRep: dioRep);
        if(rateList != null){
          if(rateList.isNotEmpty){
            return true;
          }
          else{
            return false;
          }
        }
        else{
          return false;
        }
      }
      else{
        return false;
      }

    } catch(_){
      return false;
    }
  }

  Future<List<ModelNameDto>> _getPhoneModelName({
    required int tkIdx,
    required int psIdx,
    required CommonUrl url,
    required DioRepository dioRep,
  }) async{
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    final String apiRoute = '${url.monkeyUrl}.monkeyphone.co.kr/_app/mobile/modeGetModelBySpecIdx?tk_idx=$tkIdx&ps_idx=$psIdx';
    try {
      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> modelList = jsonDecode(response.data);
      ModelNameEntity model = ModelNameEntity.fromJson(modelList);
      return model.list;
    } catch (e) {
      await dioRep.sendErrorLog(url: apiRoute, dto: _where, errorContent: '$e');
      return [];
    } finally {
      dio.close();
    }
  }

  Future<List<RatePlanDto>?> _getRatePlanMobile({
    required int tkIdx,
    required String mdModel,
    required CommonUrl url,
    required DioRepository dioRep,
  }) async {
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    final String apiRoute = '${url.monkeyUrl}.monkeyphone.co.kr/_app/plan/modeListPlanYogum_mobile?tk_idx=$tkIdx&md_model=$mdModel';
    try {
      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> rateList = jsonDecode(response.data);
      RatePlanEntity modelListRate = RatePlanEntity.fromJson(rateList);
      // if(modelListRate.rateList != null){
      //   for(var i = 0; i<modelListRate.rateList!.length; i++){
      //     final int price = int.parse(modelListRate.rateList![i].pPlanPrice!);
      //     final double vat = int.parse(modelListRate.rateList![i].pPlanPrice!)*0.1;
      //     final int v = vat.floor();
      //     final int priceVat = price+v;
      //     final double priceV = priceVat*0.1;
      //     final int priceF = priceV.floor();
      //     final int priceR = priceF*10;
      //     modelListRate.rateList![i].pPlanPrice = priceR.toString();
      //   }
      // }
      return modelListRate.rateList;

    } catch (e) {
      await dioRep.sendErrorLog(url: apiRoute, dto: _where, errorContent: '$e');
      return null;
    } finally {
      dio.close();
    }

  }


  Future<int> createDeal({
    required DioRepository dio,
    required int userIdx,
    required String joinType,
    required String currentAgency,
    required String requestAgency,
    required String joinerPhone,
    required String joinerPhoneModel,
    required String joinerPhoneIdx,
    required String joinerRatePlan,
    required String joinerRatePlanIdx,
    required String ageType,
    required int maxInstallment,
    required String guyHap,
    required String welfare,
    required String sup,
    required String etc,
  }) async {
    DataDto data = await dio.getDto(
        restApiEnum: RestApiEnum.user,
        endPoint: 'deal/create',
        repositoryName: 'CreateDealRepositoryRes',
        form: {
          "DI_reg_user_idx": "$userIdx",
          "DI_join_type": joinType,
          "DI_before_tk_idx": currentAgency,
          "DI_after_tk_idx": requestAgency,
          "DI_hope_phone": joinerPhone,
          "DI_hope_phone_model": joinerPhoneModel,
          "DI_hope_phone_idx": joinerPhoneIdx,
          "DI_hope_plan": joinerRatePlan,
          "DI_hope_plan_idx": joinerRatePlanIdx,
          "DI_age_type": ageType,
          "DI_max_installment_month": "$maxInstallment",
          "DI_combination": guyHap,
          "DI_welfare": welfare,
          "DI_requests": etc,
          "DI_support_type": sup,
        }
    );

    final int result = switch(data.statusEnum){
      StatusEnum.success => data.data.first,
      _ => 0,
    };

    return result;
  }


}