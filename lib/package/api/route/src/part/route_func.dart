import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart' as ConstString;
import 'package:banana_deal_by_monkeycompany/package/common/cache/src/provider/main_cache_provider.dart';


class RouteFunc {
  const RouteFunc();

  Future<PermissionStatus> _checkPermission(Permission permission) async {
    try{
      final PermissionStatus status = await permission.status;
      return status;
    }catch(_){
      return PermissionStatus.denied;
    }
  }

  bool _isNext({
    required MainCacheProvider mainCache,
    required PermissionStatus photos,
    required PermissionStatus location,
    required PermissionStatus notification,
    required PermissionStatus camera,
    required PermissionStatus storage,
  }) => switch(mainCache.deviceEntity.platForm){
    ConstString.ios =>
    notification == PermissionStatus.granted || mainCache.prefs.getString(ConstString.permissionIos) != null,

    ConstString.android34 || ConstString.androidNew =>
    (photos == PermissionStatus.granted || photos == PermissionStatus.limited) && location == PermissionStatus.granted
        && camera == PermissionStatus.granted && notification == PermissionStatus.granted,

    ConstString.androidOld =>
    storage == PermissionStatus.granted && location == PermissionStatus.granted
        && camera == PermissionStatus.granted && notification == PermissionStatus.granted,
    _ =>
    false
  };

  Future<bool> getPermissionData({
    required MainCacheProvider mainCache
  }) async{
    List<Future<PermissionStatus>> futureList = [
      _checkPermission(Permission.photos),
      _checkPermission(Permission.location),
      _checkPermission(Permission.notification),
      _checkPermission(Permission.camera),
      _checkPermission(Permission.storage),
    ];

    List<PermissionStatus> statusList = await Future.wait(futureList);

    bool isNext = _isNext(
      mainCache: mainCache,
      photos: statusList[0],
      location: statusList[1],
      notification: statusList[2],
      camera: statusList[3],
      storage: statusList[4],
    );

    return isNext;
  }


  Future<int> setPosition({
    required MainCacheProvider mainCache,
  }) async{
    final stopwatch = Stopwatch()..start();
    try{
      final Position position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings());
      await mainCache.prefs.setDouble(myLat, position.latitude);
      await mainCache.prefs.setDouble(myLnt, position.longitude);
      stopwatch.stop();
      return stopwatch.elapsedMilliseconds;
    } catch(_){
      await mainCache.prefs.setDouble(myLat, 37.5760222);
      await mainCache.prefs.setDouble(myLnt, 126.9769000);
      stopwatch.stop();
      return stopwatch.elapsedMilliseconds;
    }
  }

}