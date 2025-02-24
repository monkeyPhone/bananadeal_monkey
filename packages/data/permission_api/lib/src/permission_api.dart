import 'package:models/models.dart';

abstract class PermissionApi{
  const PermissionApi();

  Future<bool> getPermissionDataRoute();

  Future<PermissionDto> getPermissionData();

  Future<void> requestAll();

}