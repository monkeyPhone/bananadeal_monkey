import 'package:common_cache/common_cache.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionDeniedCheckPart {
  final CommonCache commonCache;
  const PermissionDeniedCheckPart({
    required this.commonCache,
  });

  bool deniedCheck({
    required List<PermissionStatus> statusList
  }) {
    final int sdkVersion = commonCache.mainCacheProvider.sdkVersion;
    final bool result = sdkVersion == 0
        ? false
        :  sdkVersion >= 33
        ? _androidNewApp(
      photos: statusList[0],
      location: statusList[1],
      camera: statusList[2],
      notification: statusList[3],
    )
        : _androidOldApp(
      location: statusList[1],
      camera: statusList[2],
      notification: statusList[3],
      storage: statusList[4],
    );

    return  result;
  }


  bool _androidNewApp({
    required PermissionStatus photos,
    required PermissionStatus location,
    required PermissionStatus camera,
    required PermissionStatus notification,
  }) {
    return photos == PermissionStatus.permanentlyDenied || location == PermissionStatus.permanentlyDenied
        || camera == PermissionStatus.permanentlyDenied || notification == PermissionStatus.permanentlyDenied;
  }

  bool _androidOldApp({
    required PermissionStatus location,
    required PermissionStatus camera,
    required PermissionStatus notification,
    required PermissionStatus storage,
  }) {
    return storage == PermissionStatus.permanentlyDenied || location == PermissionStatus.permanentlyDenied
        || camera == PermissionStatus.permanentlyDenied || notification == PermissionStatus.permanentlyDenied;
  }


}