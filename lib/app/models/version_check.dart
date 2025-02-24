// To parse this JSON data, do
//
//     final versionCheck = versionCheckFromJson(jsonString);

import 'dart:convert';

VersionCheck versionCheckFromJson(String str) => VersionCheck.fromJson(json.decode(str));

String versionCheckToJson(VersionCheck data) => json.encode(data.toJson());

class VersionCheck {
  int status;
  String msg;
  List<VersionCheckList> result;

  VersionCheck({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory VersionCheck.fromJson(Map<String, dynamic> json) => VersionCheck(
    status: json["status"],
    msg: json["msg"],
    result: List<VersionCheckList>.from(json["result"].map((x) => VersionCheckList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class VersionCheckList {
  int auIdx;
  String auVersion;
  String auIsUpdate;
  String auRegdate;
  String auAppStore;
  String auGoogleStore;

  VersionCheckList({
    required this.auIdx,
    required this.auVersion,
    required this.auIsUpdate,
    required this.auRegdate,
    required this.auAppStore,
    required this.auGoogleStore
  });

  factory VersionCheckList.fromJson(Map<String, dynamic> json) => VersionCheckList(
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
