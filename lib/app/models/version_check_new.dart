// To parse this JSON data, do
//
//     final versionCheck = versionCheckFromJson(jsonString);

import 'dart:convert';

VersionCheckNew versionCheckNewFromJson(String str) => VersionCheckNew.fromJson(json.decode(str));

String versionCheckNewToJson(VersionCheckNew data) => json.encode(data.toJson());

class VersionCheckNew {
  int status;
  String msg;
  List<VersionCheckNewList> result;

  VersionCheckNew({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory VersionCheckNew.fromJson(Map<String, dynamic> json) => VersionCheckNew(
    status: json["status"],
    msg: json["msg"],
    result: List<VersionCheckNewList>.from(json["result"].map((x) => VersionCheckNewList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

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
