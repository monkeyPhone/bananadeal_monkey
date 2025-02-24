import 'package:banana_deal_by_monkeycompany/package/api/permission/model/action/permission_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/permission/model/data/permission_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/api/permission/model/func/permission_func.dart';
import 'package:banana_deal_by_monkeycompany/package/api/permission/permission_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/data/device_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/func/device_func.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PermissionApiImpl extends PermissionApi {
  final PermissionAction action;
  final PermissionFunc func;

  const PermissionApiImpl({
    required this.action,
    required this.func,
  });

  @override
  Future<bool> getPermissionDataRoute({
    required DeviceFunc deviceFunc,

    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
  }) async => await action.getPermissionDataRoute(
      deviceFunc: deviceFunc,
      func: func,
      deviceEntity: deviceEntity,
      mainPrefs: mainPrefs
  );

  @override
  Future<(bool, PermissionEntity)> getPermissionData({
    required DeviceFunc deviceFunc,
    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
  }) async => await action.getPermissionData(
      deviceFunc: deviceFunc,
      func: func,
      deviceEntity: deviceEntity,
      mainPrefs: mainPrefs
  );

  @override
  Future<bool> requestAll({
    required DeviceFunc deviceFunc,
    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
  }) async => await action.requestAll(
      deviceFunc: deviceFunc,
      func: func,
      deviceEntity: deviceEntity,
      mainPrefs: mainPrefs
  );

  @override
  Future<(bool, PermissionEntity)> requestP({
    required DeviceFunc deviceFunc,
    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
  }) async => await action.requestP(
      deviceFunc: deviceFunc,
      func: func,
      deviceEntity: deviceEntity,
      mainPrefs: mainPrefs
  );

}