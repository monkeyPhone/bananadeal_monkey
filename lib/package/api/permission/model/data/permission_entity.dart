class PermissionEntity {
  const PermissionEntity({
    required this.isIos,
    required this.permissionList,
    required this.isSettings,
    required this.notification,
    required this.location,
    required this.photo,
    required this.storage,
    required this.camera

  });

  final bool isIos;
  final List<String> permissionList;
  final bool isSettings;
  final bool notification;
  final bool location;
  final bool photo;
  final bool storage;
  final bool camera;

}