// To parse this JSON data, do
//
//     final etcEventDetail = etcEventDetailFromJson(jsonString);

import 'dart:convert';

EtcEventDetail etcEventDetailFromJson(String str) => EtcEventDetail.fromJson(json.decode(str));

String etcEventDetailToJson(EtcEventDetail data) => json.encode(data.toJson());

class EtcEventDetail {
  int status;
  String msg;
  List<EtcEventDetailResult> result;

  EtcEventDetail({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory EtcEventDetail.fromJson(Map<String, dynamic> json) => EtcEventDetail(
    status: json["status"],
    msg: json["msg"],
    result: List<EtcEventDetailResult>.from(json["result"].map((x) => EtcEventDetailResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class EtcEventDetailResult {
  dynamic bepIsPrize;
  String beStatus;
  String beType;
  String beTitle;
  String beContent;
  String beUrl;
  String beNotice;
  String bePathImg2;
  String bePathImg3;
  String beResult;

  EtcEventDetailResult({
    this.bepIsPrize,
    required this.beStatus,
    required this.beType,
    required this.beTitle,
    required this.beContent,
    required this.beUrl,
    required this.beNotice,
    required this.bePathImg2,
    required this.bePathImg3,
    required this.beResult,
  });

  factory EtcEventDetailResult.fromJson(Map<String, dynamic> json) => EtcEventDetailResult(
    bepIsPrize: json["BEP_isPrize"],
    beStatus: json["BE_status"],
    beType: json["BE_type"],
    beTitle: json["BE_title"],
    beContent: json["BE_content"],
    beUrl: json["BE_url"],
    beNotice: json["BE_notice"],
    bePathImg2: json["BE_path_img2"],
    bePathImg3: json["BE_path_img3"],
    beResult: json["BE_result"],
  );

  Map<String, dynamic> toJson() => {
    "BEP_isPrize": bepIsPrize,
    "BE_status": beStatus,
    "BE_type": beType,
    "BE_title": beTitle,
    "BE_content": beContent,
    "BE_url": beUrl,
    "BE_notice": beNotice,
    "BE_path_img2": bePathImg2,
    "BE_path_img3": bePathImg3,
    "BE_result": beResult,
  };
}
