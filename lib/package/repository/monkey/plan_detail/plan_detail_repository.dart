import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_detail_entity.dart';

abstract class PlanDetailRepository {
  const PlanDetailRepository();

  Stream<List<PlanDetailDto>> streamRatePlanDetail();

  String convertHtml(String spec);

}