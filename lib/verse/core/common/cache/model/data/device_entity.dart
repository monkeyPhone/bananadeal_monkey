class DeviceEntity {
  final String platForm;
  final bool isIos;
  final int sdkVersion;
  final bool isHeight60;

  DeviceEntity({
    required this.platForm,
    required this.isIos,
    required this.sdkVersion,
    required this.isHeight60,
  });
}