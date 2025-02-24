import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_detail_entity.dart';

abstract class PlanDetailApi {
  const PlanDetailApi();

  Future<List<PlanDetailDto>> getRatePlanDetail({
    required String pIdx,
    required String monkeyUrl
  });

}