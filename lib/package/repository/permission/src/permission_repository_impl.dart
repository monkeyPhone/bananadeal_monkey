import 'package:banana_deal_by_monkeycompany/package/api/permission/model/data/permission_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/api/permission/permission_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/permission/permission_repository.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/permission/src/helper/dialog/permission_dialog.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/data/device_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/func/device_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  final PermissionApi api;
  final PermissionDialog dialog;
  final int sdkVersion;
  final SharedPreferences mainPrefs;
  final DeviceFunc deviceFunc;
  final DeviceEntity deviceEntity;
  final BuildContext context;
  const PermissionRepositoryImpl({
    required this.api,
    required this.dialog,
    required this.sdkVersion,
    required this.mainPrefs,
    required this.deviceFunc,
    required this.deviceEntity,
    required this.context
  });

  @override
  Stream<(bool, PermissionEntity)> streamGetPermissionData() =>
    Stream.fromFuture(api.getPermissionData(deviceFunc: deviceFunc, deviceEntity: deviceEntity, mainPrefs: mainPrefs));

  @override
  Stream<bool> streamRequestAll() =>
    Stream.fromFuture(api.requestAll(deviceFunc: deviceFunc, deviceEntity: deviceEntity, mainPrefs: mainPrefs));

  @override
  Stream<(bool, PermissionEntity)> streamRequestP() =>
    Stream.fromFuture(api.requestP(deviceFunc: deviceFunc, deviceEntity: deviceEntity, mainPrefs: mainPrefs));



  @override
  void openAppSettings({required List<String> permissionList})
  => dialog.permissionSettingsDialog(routerContext: context, permission: permissionList, sdkVersion: sdkVersion);

  @override
  Future<void> setString() async =>
    await mainPrefs.setString(permissionIos, 'false');

}