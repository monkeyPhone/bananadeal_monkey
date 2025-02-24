// To parse this JSON data, do
//
//     final terms = termsFromJson(jsonString);

import 'dart:convert';

Terms termsFromJson(String str) => Terms.fromJson(json.decode(str));

String termsToJson(Terms data) => json.encode(data.toJson());

class Terms {
  int status;
  String msg;
  List<TermsOfUse> result;

  Terms({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory Terms.fromJson(Map<String, dynamic> json) => Terms(
    status: json["status"],
    msg: json["msg"],
    result: List<TermsOfUse>.from(json["result"].map((x) => TermsOfUse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class TermsOfUse {
  int tIdx;
  String tService;
  String tPrivacy;
  String tLocation;

  TermsOfUse({
    required this.tIdx,
    required this.tService,
    required this.tPrivacy,
    required this.tLocation,
  });

  factory TermsOfUse.fromJson(Map<String, dynamic> json) => TermsOfUse(
    tIdx: json["T_idx"] ?? 0,
    tService: json["T_service"] ?? '',
    tPrivacy: json["T_privacy"] ?? '',
    tLocation: json["T_location"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "T_idx": tIdx,
    "T_service": tService,
    "T_privacy": tPrivacy,
    "T_location": tLocation,
  };
}
