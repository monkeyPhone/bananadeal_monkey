import 'package:banana_deal_by_monkeycompany/package/api/monkey/plan_detail/plan_detail_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_detail_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/plan_detail/plan_detail_repository.dart';

class PlanDetailRepositoryImpl implements PlanDetailRepository {
  final PlanDetailApi api;
  final String pIdx;
  final String monkeyUrl;
  const PlanDetailRepositoryImpl({
    required this.api,
    required this.pIdx,
    required this.monkeyUrl
  });

  @override
  Stream<List<PlanDetailDto>> streamRatePlanDetail() => Stream.fromFuture(api.getRatePlanDetail(pIdx: pIdx, monkeyUrl: monkeyUrl));

  @override
  String convertHtml(String spec) {
    List<String> designDetail = spec.split('\n');
    String designDetailFinal = '';
    for (int i = 0; i < designDetail.length; i++){
      designDetail[i] = designDetail[i].replaceAll('<u>', '');
      designDetail[i] = designDetail[i].replaceAll('</u>', '');
      designDetailFinal += designDetail[i];
    }

    return designDetailFinal;
  }

}