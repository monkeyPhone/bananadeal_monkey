import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class EstimateAction {
  const EstimateAction();

  final String _where = 'EstimateApi_EstimateAction';

  Future<DataDto> getEstimate({
    required int diIdx,
    required int start,
    required int order,
    required int length,
    required DioRepository dio,
  }) async{
    final DataDto dto = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'deal/estimate/list',
        limit: true,
        form: {
          "DI_idx" : "$diIdx",
          "start" : start,
          "M_order": order,
          'length' : length
        }
    );
    return dto;
  }

  Future<DataDto> postEndDeal({
    required String diHopePhone,
    required String uuid,
    required int diIdx,
    required DioRepository dio,
  }) async{
    final DataDto dto = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'deal/end',
        form: {
          "DI_hope_phone": diHopePhone,
          "DI_idx": "$diIdx",
          "M_uuid": uuid
        }
    );
    return dto;
  }

  Future<DataDto> getEstimateStatus({
    required int diIdx,
    required DioRepository dio,
  }) async{
    final DataDto dto = await dio.getDto(
      repositoryName: _where,
      restApiEnum: RestApiEnum.user,
      endPoint: 'deal/estimate/list/byidx/status/new',
      limit: true,
      form: {
        "DI_idx" : "$diIdx",
      },
    );
    return dto;
  }

}