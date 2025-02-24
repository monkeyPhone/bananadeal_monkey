import 'package:banana_deal_by_monkeycompany/package/api/rank/rank_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/rank_total/rank_total_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class RankTotalRepositoryImpl implements RankTotalRepository  {
  final RankApi rankApi;
  final DioRepository dio;
  const RankTotalRepositoryImpl({
    required this.rankApi,
    required this.dio,
  });

  @override
  Stream<DataDto> getRankGrade(String grade) => Stream.fromFuture(rankApi.getRankGrade(dio: dio, grade: grade));

}