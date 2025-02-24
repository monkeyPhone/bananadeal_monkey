class VersionCheckDto {
  final int auIdx;
  final String auVersion;
  final String auIsUpdate;
  final String auRegdate;
  final String auAppStore;
  final String auGoogleStore;

  const VersionCheckDto({
    required this.auIdx,
    required this.auVersion,
    required this.auIsUpdate,
    required this.auRegdate,
    required this.auAppStore,
    required this.auGoogleStore
  });

  factory VersionCheckDto.fromJson(Map<String, dynamic> json) => VersionCheckDto(
      auIdx: json["AU_idx"] ?? 0,
      auVersion: json["AU_version"] ?? '',
      auIsUpdate: json["AU_isUpdate"] ?? '',
      auRegdate: json["AU_regdate"] ?? '',
      auAppStore: json["AU_appStore"] ?? '',
      auGoogleStore: json["AU_googleStore"] ?? ''
  );

  Map<String, dynamic> toJson() => {
    "AU_idx": auIdx,
    "AU_version": auVersion,
    "AU_isUpdate": auIsUpdate,
    "AU_regdate": auRegdate,
    "AU_appStore": auAppStore,
    "AU_googleStore": auGoogleStore
  };
}