import 'package:banana_deal_by_monkeycompany/package/api/monkey/plan/plan_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/plan/plan_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class PlanRepositoryImpl extends  PlanRepository{
  final PlanApi api;
  final String monkeyUrl;
  final DioRepository dio;
  const PlanRepositoryImpl({
    required this.api,
    required this.monkeyUrl,
    required this.dio,
  });

  @override
  Stream<PlanVO> streamRatePlan({
    required String tkIdx, required String psIdx,
  }) => Stream.fromFuture(api.getRatePlan(tkIdx: tkIdx, psIdx: psIdx, monkeyUrl: monkeyUrl, dioRep: dio));

  @override
  Future<List<PlanDto>> getRatePlanSearch({
    required String tkIdx,
    required String psIdx,
    required String keyword,
  }) async => await api.getRatePlanSearch(tkIdx: tkIdx, psIdx: psIdx, keyword: keyword, monkeyUrl: monkeyUrl, dioRep: dio);

}