import 'package:common_cache/common_cache.dart';
import 'package:permission_handler/permission_handler.dart';

import 'const.dart';

class PermissionMakeDialogListPart {
  final CommonCache commonCache;
  const PermissionMakeDialogListPart({
    required this.commonCache,
  });

  List<String> makeList({
    required List<PermissionStatus> statusList
  }){
    final int sdkVersion = commonCache.mainCacheProvider.sdkVersion;

    List<String> result =
    sdkVersion == 0
        ? []
        : sdkVersion >= 33
        ? [
      statusList[0] == PermissionStatus.permanentlyDenied || statusList[0] == PermissionStatus.denied ? permissionPhoto : '',
      statusList[1] == PermissionStatus.permanentlyDenied || statusList[1] == PermissionStatus.denied ? permissionLocation : '',
      statusList[2] == PermissionStatus.permanentlyDenied || statusList[2] == PermissionStatus.denied ? permissionCamera : '',
      statusList[3] == PermissionStatus.permanentlyDenied ||  statusList[3] == PermissionStatus.denied ? permissionNoti : '',
    ]
        : [
      statusList[1] == PermissionStatus.permanentlyDenied ? permissionLocation : '',
      statusList[2] == PermissionStatus.permanentlyDenied ? permissionCamera : '',
      statusList[3] == PermissionStatus.permanentlyDenied ? permissionNoti : '',
      statusList[4] == PermissionStatus.permanentlyDenied ? permissionPhoto : '',

    ];
    return result;
  }


  List<Permission> getPermissionList({
    required CommonCache commonCache,
  }){
    final List<Permission> result =
    switch(commonCache.mainCacheProvider.platForm){
      androidNew || android34 ||  ios => androidNewList,
      androidOld => androidOldList,
      _ => []
    };
    // switch(deviceEntity.platForm){
    //   ConstString.ios => _ios,
    //   ConstString.android34 => _android34,
    //   ConstString.androidNew => _androidNew,
    //   ConstString.androidOld => _androidOld,
    //   _ => []
    // };
    return result;
  }

}