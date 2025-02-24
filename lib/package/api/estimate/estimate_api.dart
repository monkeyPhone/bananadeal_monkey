import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class EstimateApi {
  const EstimateApi();

  Future<DataDto> getEstimate({
    required DioRepository dio,
    required int diIdx,
    required int start,
    required int order,
    required int length
  });

  Future<DataDto> postEndDeal({
    required DioRepository dio,
    required String diHopePhone,
    required String uuid,
    required int diIdx
  });

  Future<DataDto> getEstimateStatus({
    required DioRepository dio,
    required int diIdx
  });

}