
import 'package:banana_deal_by_monkeycompany/package/data/estimate_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class EstimateRepository {
  const EstimateRepository();

  Stream<DataDto> streamEstimate({
    required int diIdx,
    required int start,
    required int order,
    required int length
  });

  Future<DataDto> getEstimate({
    required int diIdx,
    required int start,
    required int order,
    required int length
  });

  Future<DataDto> postEndDeal({
    required String diHopePhone,
    required String uuid,
    required int diIdx
  });

  Stream<DataDto> streamEstimateStatus({
    required int diIdx
  });


}