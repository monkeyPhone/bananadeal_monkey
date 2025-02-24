import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/data/splash_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class CheckVersionApi {

  const CheckVersionApi();

  Future<SplashVO> getAppVersion(DioRepository dio);

  Future<bool> getAppVersionRouting(DioRepository dio);

}


