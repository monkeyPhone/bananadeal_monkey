import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/data/splash_vo.dart';

abstract class SplashRepository {
  const SplashRepository();
  Stream<SplashVO> streamGetAppVersion();
}