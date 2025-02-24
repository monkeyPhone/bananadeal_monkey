import 'package:banana_deal_by_monkeycompany/package/api/monkey/plan/model/action/plan_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/plan/plan_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class PlanApiImpl implements PlanApi {
  final PlanAction action;
  const PlanApiImpl({
    required this.action
  });

  @override
  Future<PlanVO> getRatePlan({
    required String tkIdx, required String psIdx, required String monkeyUrl, required DioRepository dioRep,
  }) async => await action.getRatePlan(tkIdx: tkIdx, psIdx: psIdx, monkeyUrl: monkeyUrl, dioRep: dioRep);

  @override
  Future<List<PlanDto>> getRatePlanSearch({
    required String tkIdx,
    required String psIdx,
    required String keyword,
    required String monkeyUrl,
    required DioRepository dioRep
  }) async => await action.getRatePlanSearch(tkIdx: tkIdx, psIdx: psIdx, keyword: keyword, monkeyUrl: monkeyUrl, dioRep: dioRep);

}