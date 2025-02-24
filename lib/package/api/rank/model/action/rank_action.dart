import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class RankAction {
  const RankAction();

  final String _where = 'RankAction';

  Future<DataDto> getRank({
    required DioRepository dio
  }) async{
    final DataDto result = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'member/phone/ranklist',
        limit: true
    );
    return result;
  }

  Future<DataDto> getRankGrade({
    required DioRepository dio,
    required String grade
  }) async{
    DataDto dto = await  dio.getDto(
        repositoryName: _where,
        form: {
          "LDCP_mobileGrade": grade
        },
        restApiEnum: RestApiEnum.user,
        endPoint: 'member/phone/ranklist/item',
        limit: true
    );
    return dto;
  }


  Future<DataDto> getRankAll({
    required DioRepository dio,
  }) async {
    final DataDto dto = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'member/phone/ranklist/all'
    );
    return dto;
  }


}