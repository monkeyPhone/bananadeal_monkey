import 'package:banana_deal_by_monkeycompany/package/api/check_version/check_version_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/data/splash_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/splash/splash_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final CheckVersionApi api;
  final DioRepository dio;
  const SplashRepositoryImpl({
    required this.api,
    required this.dio,
  });
  
  @override
  Stream<SplashVO> streamGetAppVersion() => Stream.fromFuture(api.getAppVersion(dio));
}