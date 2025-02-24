import 'dart:convert';
import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/data/version_check_dto.dart';


VersionCheckEntity versionCheckEntityFromJson(String str) => VersionCheckEntity.fromJson(json.decode(str));

String versionCheckEntityToJson(VersionCheckEntity data) => json.encode(data.toJson());

class VersionCheckEntity {
  final int status;
  final String msg;
  final List<VersionCheckDto> result;

  const VersionCheckEntity({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory VersionCheckEntity.fromJson(Map<String, dynamic> json) => VersionCheckEntity(
    status: json["status"],
    msg: json["msg"],
    result: List<VersionCheckDto>.from(json["result"].map((x) => VersionCheckDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}