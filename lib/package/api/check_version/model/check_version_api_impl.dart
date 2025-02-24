import 'package:banana_deal_by_monkeycompany/package/api/check_version/check_version_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/action/check_version_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/data/splash_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class CheckVersionApiImpl implements CheckVersionApi {
  final CheckVersionAction action;
  const CheckVersionApiImpl({
    required this.action,
  });

  @override
  Future<SplashVO> getAppVersion(DioRepository dio) async => await action.getAppVersion(dio);

  @override
  Future<bool> getAppVersionRouting(DioRepository dio) async => await action.getAppVersionRouting(dio);


}