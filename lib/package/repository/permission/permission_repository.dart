import 'package:banana_deal_by_monkeycompany/package/api/permission/model/data/permission_entity.dart';
import 'package:flutter/material.dart';

abstract class PermissionRepository {
  const PermissionRepository();

  Stream<(bool, PermissionEntity)> streamGetPermissionData();

  Stream<bool> streamRequestAll();


  void openAppSettings({required List<String> permissionList});

  Future<void> setString();

}