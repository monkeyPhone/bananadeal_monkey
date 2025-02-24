
class VersionCheckNewList {

  String auVersion;
  String auIsUpdate;
  String auUrl;

  VersionCheckNewList({
    required this.auVersion,
    required this.auIsUpdate,
    required this.auUrl,
  });

  factory VersionCheckNewList.fromJson(Map<String, dynamic> json) => VersionCheckNewList(
    auVersion: json["AU_version"] ?? '',
    auIsUpdate: json["AU_isUpdate"] ?? '',
    auUrl: json["AU_url"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "AU_version": auVersion,
    "AU_isUpdate": auIsUpdate,
    "AU_url": auUrl,
  };
}
