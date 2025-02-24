import 'package:banana_deal_by_monkeycompany/package/api/rank/model/action/rank_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/rank/rank_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class RankApiImpl implements RankApi {
  final RankAction action;
  const RankApiImpl({
    required this.action,
  });

  @override
  Future<DataDto> getRank({
    required DioRepository dio
  }) async => await action.getRank(dio: dio);

  @override
  Future<DataDto> getRankGrade({
    required DioRepository dio,
    required String grade
  }) async => await action.getRankGrade(dio: dio, grade: grade);

  @override
  Future<DataDto> getRankAll({
    required DioRepository dio,
  }) async => await action.getRankAll(dio: dio);
}