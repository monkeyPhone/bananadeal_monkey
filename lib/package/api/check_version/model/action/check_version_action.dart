import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/data/splash_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/data/version_check_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/data/version_check_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/json_error.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:package_info_plus/package_info_plus.dart';


class CheckVersionAction {

  final String _where = 'CheckVersionAction';
  const CheckVersionAction();

  Future<String> _checkAppVersion() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<SplashVO> getAppVersion(DioRepository dio) async{
    final Map<String, dynamic> response = await dio.getJson(endPoint: 'appinfo/version', repositoryName: _where, restApiEnum: RestApiEnum.guest);
    final VersionCheckEntity result = VersionCheckEntity.fromJson(response);
    final String currentVersion = await _checkAppVersion();
    final StatusEnum statusEnum =
    dio.convert.func.getStatus(
        status: result.status,
        routeCase: result.status == 200 ? result.result.first.auVersion == currentVersion : null
    );
    VersionCheckDto? contents = switch(statusEnum){
      StatusEnum.later =>
      result.result.first,
      _=> null
    };

    JsonError? error = dio.convert.func.isError(statusEnum)
        ? jsonErrorFromJson(result.msg)
        : null;

    return SplashVO(
        statusEnum: statusEnum,
        contents: contents,
        currentVersion: currentVersion,
        error: error
    );
  }

  Future<bool> getAppVersionRouting(DioRepository dio) async {
    final Map<String, dynamic> response = await dio.getJson(endPoint: 'appinfo/version', repositoryName: _where, restApiEnum: RestApiEnum.guest);
    final VersionCheckEntity result = VersionCheckEntity.fromJson(response);
    final String currentVersion = await _checkAppVersion();
    final bool nextPage;

    if(result.status == 200){
      if(result.result.first.auVersion == currentVersion){
        nextPage = true;
      } else {
        nextPage = false;
      }
    }
    else {
      nextPage = false;
    }
    return nextPage;
  }


}