import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class RankApi {
  const RankApi();

  Future<DataDto> getRank({
    required DioRepository dio
  });

  Future<DataDto> getRankGrade({
    required DioRepository dio,
    required String grade
  });

  Future<DataDto> getRankAll({
    required DioRepository dio,
  });

}