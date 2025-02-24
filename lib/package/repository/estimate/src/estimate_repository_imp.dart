import 'package:banana_deal_by_monkeycompany/package/api/estimate/estimate_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/estimate/estimate_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';


class EstimateRepositoryImpl implements EstimateRepository{
  final EstimateApi api;
  final DioRepository dio;
  const EstimateRepositoryImpl({
    required this.api,
    required this.dio,
  });

  @override
  Stream<DataDto> streamEstimate({
    required int diIdx,
    required int start,
    required int order,
    required int length
  }) => Stream.fromFuture(getEstimate(diIdx: diIdx, start: start, order: order, length: length));

  @override
  Future<DataDto> getEstimate({
    required int diIdx,
    required int start,
    required int order,
    required int length
  }) async => await api.getEstimate(diIdx: diIdx, start: start, order: order, length: length, dio: dio);


  @override
  Future<DataDto> postEndDeal({
    required String diHopePhone,
    required String uuid,
    required int diIdx
  }) async => await api.postEndDeal(diHopePhone: diHopePhone, uuid: uuid, diIdx: diIdx, dio: dio);


  @override
  Stream<DataDto> streamEstimateStatus({
    required int diIdx
  }) => Stream.fromFuture(api.getEstimateStatus(diIdx: diIdx, dio: dio));

}