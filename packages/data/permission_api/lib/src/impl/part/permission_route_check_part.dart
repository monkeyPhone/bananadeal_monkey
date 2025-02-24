import 'package:common_cache/common_cache.dart';
import 'package:permission_handler/permission_handler.dart';

import 'const.dart';

class PermissionRouteCheckPart {
  final CommonCache commonCache;
  const PermissionRouteCheckPart({
    required this.commonCache,
  });

  bool nextPage({
    required List<PermissionStatus> statusList


  }){
    final bool result
    = switch(commonCache.mainCacheProvider.platForm){
      ios =>
          _iosPermission(notification:statusList[3]),
      androidOld =>
          _androidOldPermission(
            location: statusList[1],
            camera: statusList[2],
            notification: statusList[3],
            storage: statusList[4],
          ),
      _ =>
          _androidNewPermission(
            photos: statusList[0],
            location: statusList[1],
            camera: statusList[2],
            notification: statusList[3],
          )
    };
    return result;
  }

  bool _iosPermission({
    required PermissionStatus notification,
  }) => notification == PermissionStatus.granted || commonCache.mainCacheProvider.prefs.getString(permissionIos) != null;


  bool _androidNewPermission({
    required PermissionStatus photos,
    required PermissionStatus location,
    required PermissionStatus camera,
    required PermissionStatus notification,
  }) {
    return (photos == PermissionStatus.granted || photos == PermissionStatus.limited) && location == PermissionStatus.granted
        && camera == PermissionStatus.granted && notification == PermissionStatus.granted;
  }

  bool _androidOldPermission({
    required PermissionStatus location,
    required PermissionStatus camera,
    required PermissionStatus notification,
    required PermissionStatus storage,
  }) {
    return storage == PermissionStatus.granted && location == PermissionStatus.granted
        && camera == PermissionStatus.granted && notification == PermissionStatus.granted;
  }

}