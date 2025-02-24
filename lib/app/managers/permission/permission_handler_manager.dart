import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';


class PermissionHandlerManager {

  static const Permission location = Permission.location;
  static const Permission camera = Permission.camera;
  static const Permission photos = Permission.photos;
  static const Permission noti = Permission.notification;
  static const Permission storage = Permission.storage;
  static const Permission notiPush = Permission.accessNotificationPolicy;

  static const PermissionStatus granted = PermissionStatus.granted;
  static const PermissionStatus denied = PermissionStatus.denied;
  static const  PermissionStatus permanentlyDenied = PermissionStatus.permanentlyDenied;
  static const PermissionStatus limited = PermissionStatus.limited;

  Future<PermissionStatus> checkPermission(Permission permission) async {
    final PermissionStatus status = await permission.status;
    return status;
  }

  Future<Map<Permission, PermissionStatus>> requestPermissions(List<Permission> permissionList) async{
    Map<Permission, PermissionStatus> statuses = await permissionList.request();
    return statuses;
  }

  Future<PermissionStatus> requestPermission(Permission permission) async {
    if(GetPlatform.isAndroid){
      await requestPermissionAndroid(permission);
    }
    if(GetPlatform.isIOS){
      await requestPermissionIos(permission);
    }
    return await checkPermission(permission);
  }

  Future<void> requestPermissionAndroid(Permission permission) async {
    await [
      permission
    ].request();
  }


  Future<void> requestPermissionIos(Permission permission) async {
    await permission.request();
    if(await permission.status == permanentlyDenied || await permission.status == limited){
      AppSettings.openAppSettings(type: AppSettingsType.settings);
    }
  }



  void openInternet(){
    AppSettings.openAppSettings(type: AppSettingsType.wifi);
  }
  void openLocation(){
    AppSettings.openAppSettings(type: AppSettingsType.location);
  }

  void openAppSetting(){
    AppSettings.openAppSettings(type: AppSettingsType.settings);
  }

}
