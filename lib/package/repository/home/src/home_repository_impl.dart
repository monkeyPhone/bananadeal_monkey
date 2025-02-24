import 'package:banana_deal_by_monkeycompany/package/api/banner/banner_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/rank/rank_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/home/home_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final BannerApi bannerApi;
  final RankApi rankApi;
  final DioRepository dio;
  const HomeRepositoryImpl({
    required this.bannerApi,
    required this.rankApi,
    required this.dio
  });

  @override
  Stream<DataDto> streamBanner() => Stream.fromFuture(bannerApi.getBanner(dio: dio));
  @override
  Stream<DataDto> streamRank() => Stream.fromFuture(rankApi.getRankAll(dio: dio));

}