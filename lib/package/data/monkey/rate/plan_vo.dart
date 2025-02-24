import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_group_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class PlanVO {
  final StatusEnum statusEnum;
  final List<PlanGroupDto> planGroup;
  final List<PlanDto> planList;

  const PlanVO({
    required this.statusEnum,
    required this.planGroup,
    required this.planList,
  });
}