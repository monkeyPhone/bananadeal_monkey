import 'package:banana_deal_by_monkeycompany/package/api/permission/model/data/permission_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/api/permission/model/func/permission_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/data/device_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/func/device_func.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PermissionAction {
  PermissionAction();

  late PermissionStatus _photos;
  late PermissionStatus _location;
  late PermissionStatus _camera;
  late PermissionStatus _notification;
  late PermissionStatus _storage;

  Future<bool> getPermissionDataRoute({
    required DeviceFunc deviceFunc,
    required PermissionFunc func,
    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
  }) async{
    _photos = await deviceFunc.checkPermission(Permission.photos);
    _location = await deviceFunc.checkPermission(Permission.location);
    _camera = await deviceFunc.checkPermission(Permission.camera);
    _notification = await deviceFunc.checkPermission(Permission.notification);
    _storage = await deviceFunc.checkPermission(Permission.storage);

    final bool result = func.nextPage(
        photos: _photos,
        location: _location,
        camera: _camera,
        notification: _notification,
        storage: _storage, deviceEntity: deviceEntity, mainPrefs: mainPrefs);

    return result;
  }


  Future<(bool, PermissionEntity)> getPermissionData({
    required DeviceFunc deviceFunc,
    required PermissionFunc func,
    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
  }) async{
    final bool resultBool = await getPermissionDataRoute(
        deviceFunc: deviceFunc, func: func, deviceEntity: deviceEntity, mainPrefs: mainPrefs
    );
    final bool setBool = func.bringSetApp(
        photos: _photos,
        location: _location,
        camera: _camera,
        notification: _notification,
        storage: _storage,
        deviceEntity: deviceEntity
    );
    final PermissionEntity result = PermissionEntity(
      permissionList: func.makeList(
          photos: _photos,
          location: _location,
          camera: _camera,
          notification: _notification,
          storage: _storage,
          deviceEntity: deviceEntity
      ),
      notification: _notification == PermissionStatus.granted,
      location: _location == PermissionStatus.granted,
      photo: _photos == PermissionStatus.granted || _photos == PermissionStatus.limited,
      storage: _storage == PermissionStatus.granted,
      camera: _camera == PermissionStatus.granted,
      isSettings: setBool,
      isIos: deviceEntity.isIos
    );

    return (resultBool, result);
  }


  Future<bool> requestAll({
    required DeviceFunc deviceFunc,
    required PermissionFunc func,
    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
  }) async{
    try{
      await func.getPermissionList(deviceEntity: deviceEntity).request();
      return true;
    } catch(_){
      return false;
    }
  }

  Future<(bool, PermissionEntity)> requestP({
    required DeviceFunc deviceFunc,
    required PermissionFunc func,
    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
  }) async{
    switch(deviceEntity.sdkVersion){
      case 0:
        _requestP(
            permission:Permission.notification,
            deviceFunc: deviceFunc,
            func: func,
            deviceEntity: deviceEntity,
            mainPrefs: mainPrefs
        );
      case 34:
        _requestP(
            permission: Permission.photos,
            deviceFunc: deviceFunc,
            func: func,
            deviceEntity: deviceEntity,
            mainPrefs: mainPrefs
        );
      default:
        await getPermissionData(
            deviceFunc: deviceFunc,
            func: func,
            deviceEntity: deviceEntity,
            mainPrefs: mainPrefs
        );

    }
    (bool, PermissionEntity) result =  switch(deviceEntity.sdkVersion){
      0 => await _requestP(
          permission: Permission.notification,
          deviceFunc: deviceFunc,
          func: func,
          deviceEntity: deviceEntity,
          mainPrefs: mainPrefs
      ),
      34 => await _requestP(
            permission:Permission.photos,
          deviceFunc: deviceFunc,
          func: func,
          deviceEntity: deviceEntity,
          mainPrefs: mainPrefs
            ),
      _ =>  await getPermissionData(
          deviceFunc: deviceFunc,
          func: func,
          deviceEntity: deviceEntity,
          mainPrefs: mainPrefs
      )
    };
    return result;
  }

  Future<(bool, PermissionEntity)> _requestP({
    required Permission permission,
    required DeviceFunc deviceFunc,
    required PermissionFunc func,
    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
  }) async{
    await permission.request();
    (bool, PermissionEntity) result =  await getPermissionData(
        deviceFunc: deviceFunc,
        func: func,
        deviceEntity: deviceEntity,
        mainPrefs: mainPrefs
    );
    return result;
  }

}