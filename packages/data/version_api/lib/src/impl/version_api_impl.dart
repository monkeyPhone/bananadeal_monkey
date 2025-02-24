import 'package:common_cache/common_cache.dart';
import 'package:common_network/common_network.dart';
import 'package:common_url/common_url.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version_api/src/impl/models/version_check_entity.dart';

class VersionApiImpl {
  final CommonNetwork commonNetwork;
  final CommonUrl commonUrl;
  final CommonCache commonCache;
  const VersionApiImpl({
    required this.commonNetwork,
    required this.commonUrl,
    required this.commonCache,
  });

  final String _where = 'VersionApiImpl';

  Future<String> _checkAppVersion() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  List<VersionCheckNewList> _convertVersionCheckNewList(List<dynamic> data) {
    return data.map((item) => VersionCheckNewList.fromJson(item as Map<String, dynamic>)).toList();
  }

  Future<(EnumStatus, bool, bool, String, String,)> getAppVersion() async{

    final DataEntity entity = await commonNetwork.getEntity(
        form: {
          "osType" : commonCache.mainCacheProvider.isIos
              ?  'IOS'
              : 'ANDROID'
        },
        where: _where, enumRestApi: EnumRestapi.guest, endPoint: 'appinfo/version/new'
    );
    if(entity.status == 200){
      final VersionCheckNewList checkNewList = _convertVersionCheckNewList(entity.result).first;
      final String appVersion = await _checkAppVersion();
      int? intAppVersion = int.tryParse(appVersion.replaceAll('.', ''));
      int? serverVersion = int.tryParse(checkNewList.auVersion.replaceAll('.', ''));
      bool isS = (intAppVersion != null && serverVersion != null);
      bool isSuc = ( intAppVersion! < serverVersion!);
      bool isUpadate =  isS && isSuc;
      bool isUpdateMust = checkNewList.auIsUpdate == 'Y';
      final (EnumStatus ,bool, bool, String, String,) result = (EnumStatus.success, isUpadate, isUpdateMust ,appVersion, checkNewList.auVersion);
      return result;
    }
    else{
      return (EnumStatus.error ,false, false, '', '');
    }

  }


  Future<bool> getAppVersionRouting() async {
    final (EnumStatus, bool, bool, String, String,) route = await getAppVersion();
    final bool isNext = route.$1 == EnumStatus.success && !route.$2;
    return isNext;
  }


}