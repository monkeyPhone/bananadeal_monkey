import 'package:banana_deal_by_monkeycompany/package/api/monkey/plan_detail/model/action/plan_detail_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/plan_detail/plan_detail_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_detail_entity.dart';

class PlanDetailApiImpl implements PlanDetailApi {
  final PlanDetailAction action;
  const PlanDetailApiImpl({
    required this.action,
  });

  @override
  Future<List<PlanDetailDto>> getRatePlanDetail({
    required String pIdx,
    required String monkeyUrl
  }) => action.getRatePlanDetail(pIdx: pIdx, monkeyUrl: monkeyUrl);

}