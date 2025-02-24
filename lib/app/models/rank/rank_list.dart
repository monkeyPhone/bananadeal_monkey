// To parse this JSON data, do
//
//     final init = initFromJson(jsonString);

import 'dart:convert';

RankList initFromJson(String str) => RankList.fromJson(json.decode(str));

String initToJson(RankList data) => json.encode(data.toJson());

Rankinfo? rankinfoFromJson(String str) => Rankinfo.fromJson(json.decode(str));

String rankinfoToJson(Rankinfo? data) => json.encode(data!.toJson());



class RankList {
  RankList({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<Rankinfo> result;

  factory RankList.fromJson(Map<String, dynamic> json) => RankList(
    status: json["status"],
    msg: json["msg"],
    result: List<Rankinfo>.from(json["result"].map((x) => Rankinfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Rankinfo {
  Rankinfo({
    required this.psIdx,
    required this.psName,
    required this.psModel,
    required this.psMobileGrade,
    required this.piPath,
    required this.cnt,
  });

  int psIdx;
  String psName;
  String psModel;
  String psMobileGrade;
  String piPath;
  int cnt;

  factory Rankinfo.fromJson(Map<String, dynamic> json) => Rankinfo(
    psIdx: json["PR_ps_idx"] ?? 0,
    psName: json["PR_ps_name"] ?? '',
    psModel: json["PR_ps_model"] ?? '',
    psMobileGrade: json["PR_ps_mobileGrade"] ?? '',
    piPath: json["PR_pi_path"] ?? '',
    cnt: json["PR_cnt"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "PR_ps_idx": psIdx,
    "PR_ps_name": psName,
    "PR_ps_model": psModel,
    "PR_ps_mobileGrade": psMobileGrade,
    "PR_pi_path": piPath,
    "PR_cnt": cnt,
  };
}


