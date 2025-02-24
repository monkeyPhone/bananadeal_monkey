import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_vo.dart';

abstract class PlanRepository {
  const PlanRepository();

  Stream<PlanVO> streamRatePlan({
    required String tkIdx, required String psIdx,
  });

  Future<List<PlanDto>> getRatePlanSearch({
    required String tkIdx,
    required String psIdx,
    required String keyword,
  });

}