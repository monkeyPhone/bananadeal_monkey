import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class PlanApi {
  const PlanApi();

  Future<PlanVO> getRatePlan({
    required String tkIdx, required String psIdx, required String monkeyUrl, required DioRepository dioRep,
  });

  Future<List<PlanDto>> getRatePlanSearch({
    required String tkIdx,
    required String psIdx,
    required String keyword,
    required String monkeyUrl,
    required DioRepository dioRep
  });

}