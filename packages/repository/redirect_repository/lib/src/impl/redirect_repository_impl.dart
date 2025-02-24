import 'package:permission_api/permission_api.dart';
import 'package:redirect_repository/src/redirect_repository.dart';

class RedirectRepositoryImpl implements RedirectRepository {
  final PermissionApi permissionApi;
  const RedirectRepositoryImpl({
    required this.permissionApi
  });

  @override
  Stream<bool> routePermission() => Stream.fromFuture(permissionApi.getPermissionDataRoute());

}