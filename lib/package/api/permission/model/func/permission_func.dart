import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/data/device_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart' as ConstString;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PermissionFunc {
  PermissionFunc();


  // final List<Permission> _ios = [
  //   Permission.location,
  //   Permission.photos,
  //   Permission.camera,
  // ];
  //
  // final List<Permission> _android34 = [
  //   Permission.location,
  //   Permission.camera,
  //   Permission.notification,
  // ];

  final List<Permission> _androidNew = [
    Permission.photos,
    Permission.location,
    Permission.camera,
    Permission.notification,
  ];

  final List<Permission> _androidOld = [
    Permission.storage,
    Permission.location,
    Permission.camera,
    Permission.notification,
  ];


  bool nextPage({
    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
    required PermissionStatus photos,
    required PermissionStatus location,
    required PermissionStatus camera,
    required PermissionStatus notification,
    required PermissionStatus storage,

  }){
    final bool result
    = switch(deviceEntity.platForm){
      ConstString.ios =>
          _iosPermission(notification:notification, mainPrefs: mainPrefs),
      ConstString.android34 =>
          _androidNewPermission(
            photos: photos,
            location: location,
            camera: camera,
            notification: notification,
          ),
      ConstString.androidNew =>
          _androidNewPermission(
            photos: photos,
            location: location,
            camera: camera,
            notification: notification,
          ),
      ConstString.androidOld =>
          _androidOldPermission(
            storage: storage,
            location: location,
            camera: camera,
            notification: notification,
          ),
      _ =>
      false
    };
    return result;
  }

  bool _iosPermission({
    required PermissionStatus notification,
    required SharedPreferences mainPrefs
  }){
    return notification == PermissionStatus.granted || mainPrefs.getString(ConstString.permissionIos) != null;
  }

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
    required PermissionStatus storage,
    required PermissionStatus location,
    required PermissionStatus camera,
    required PermissionStatus notification,
  }) {
    return storage == PermissionStatus.granted && location == PermissionStatus.granted
        && camera == PermissionStatus.granted && notification == PermissionStatus.granted;
  }


  bool bringSetApp({
    required DeviceEntity deviceEntity,
    required PermissionStatus photos,
    required PermissionStatus location,
    required PermissionStatus camera,
    required PermissionStatus notification,
    required PermissionStatus storage,
  }) =>
      deviceEntity.sdkVersion == 0
          ? false
          :  deviceEntity.sdkVersion >= 33
          ? _androidNewApp(
        photos: photos,
        location: location,
        camera: camera,
        notification: notification,
      )
          : _androidOldApp(
        storage: storage,
        location: location,
        camera: camera,
        notification: notification,
      );


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
    required PermissionStatus storage,
    required PermissionStatus location,
    required PermissionStatus camera,
    required PermissionStatus notification,
  }) {
    return storage == PermissionStatus.permanentlyDenied || location == PermissionStatus.permanentlyDenied
        || camera == PermissionStatus.permanentlyDenied || notification == PermissionStatus.permanentlyDenied;
  }


  List<String> makeList({
    required DeviceEntity deviceEntity,
    required PermissionStatus photos,
    required PermissionStatus location,
    required PermissionStatus camera,
    required PermissionStatus notification,
    required PermissionStatus storage,
  }){
    int sdkVersion = deviceEntity.sdkVersion;
    List<String> result =
    sdkVersion == 0
        ? []
        : sdkVersion >= 33
        ? [
      notification == PermissionStatus.permanentlyDenied ||  notification == PermissionStatus.denied ? ConstString.permissionNoti : '',
      location == PermissionStatus.permanentlyDenied || location == PermissionStatus.denied ? ConstString.permissionLocation : '',
      photos == PermissionStatus.permanentlyDenied || photos == PermissionStatus.denied ? ConstString.permissionPhoto : '',
      camera == PermissionStatus.permanentlyDenied || camera == PermissionStatus.denied ? ConstString.permissionCamera : ''
    ]
        : [
      notification == PermissionStatus.permanentlyDenied ? ConstString.permissionNoti : '',
      location == PermissionStatus.permanentlyDenied ? ConstString.permissionLocation : '',
      storage == PermissionStatus.permanentlyDenied ? ConstString.permissionPhoto : '',
      camera == PermissionStatus.permanentlyDenied ? ConstString.permissionCamera : ''
    ];
    return result;
  }


  List<Permission> getPermissionList({
    required DeviceEntity deviceEntity,
  }){
    final List<Permission> result =
    switch(deviceEntity.platForm){
      ConstString.androidNew || ConstString.android34 ||  ConstString.ios => _androidNew,
      ConstString.androidOld => _androidOld,
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