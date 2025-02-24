import 'package:banana_deal_by_monkeycompany/package/api/estimate/estimate_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/estimate/model/action/estimate_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class EstimateApiImpl implements EstimateApi {
  final EstimateAction action;

  const EstimateApiImpl({
    required this.action,
  });

  @override
  Future<DataDto> getEstimate({
    required DioRepository dio,
    required int diIdx,
    required int start,
    required int order,
    required int length
  }) async => await action.getEstimate(diIdx: diIdx, start: start, order: order, length: length, dio: dio);

  @override
  Future<DataDto> postEndDeal({
    required DioRepository dio,
    required String diHopePhone,
    required String uuid,
    required int diIdx
  }) async => await action.postEndDeal(diHopePhone: diHopePhone, uuid: uuid, diIdx: diIdx, dio: dio);

  @override
  Future<DataDto> getEstimateStatus({
    required DioRepository dio,
    required int diIdx
  }) async => await action.getEstimateStatus(diIdx: diIdx, dio: dio);

}