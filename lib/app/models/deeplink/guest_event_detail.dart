// To parse this JSON data, do
//
//     final guestEventDetail = guestEventDetailFromJson(jsonString);

import 'dart:convert';

GuestEventDetail guestEventDetailFromJson(String str) => GuestEventDetail.fromJson(json.decode(str));

String guestEventDetailToJson(GuestEventDetail data) => json.encode(data.toJson());

class GuestEventDetail {
  int status;
  String msg;
  List<GuestEventDetailList> result;

  GuestEventDetail({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory GuestEventDetail.fromJson(Map<String, dynamic> json) => GuestEventDetail(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? '',
    result: List<GuestEventDetailList>.from(json["result"].map((x) => GuestEventDetailList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class GuestEventDetailList {
  int beIdx;
  String beType;
  String beTitle;
  String beContent;
  String beUrl;
  DateTime bePeriodStart;
  DateTime bePeriodEnd;
  String beNotice;
  String bePathImg1;
  String bePathImg2;
  String bePathImg3;
  String beResult;
  DateTime beRegdate;

  GuestEventDetailList({
    required this.beIdx,
    required this.beType,
    required this.beTitle,
    required this.beContent,
    required this.beUrl,
    required this.bePeriodStart,
    required this.bePeriodEnd,
    required this.beNotice,
    required this.bePathImg1,
    required this.bePathImg2,
    required this.bePathImg3,
    required this.beResult,
    required this.beRegdate,
  });

  factory GuestEventDetailList.fromJson(Map<String, dynamic> json) => GuestEventDetailList(
    beIdx: json["BE_idx"],
    beType: json["BE_type"],
    beTitle: json["BE_title"],
    beContent: json["BE_content"],
    beUrl: json["BE_url"],
    bePeriodStart: DateTime.parse(json["BE_period_start"]),
    bePeriodEnd: DateTime.parse(json["BE_period_end"]),
    beNotice: json["BE_notice"],
    bePathImg1: json["BE_path_img1"],
    bePathImg2: json["BE_path_img2"],
    bePathImg3: json["BE_path_img3"],
    beResult: json["BE_result"],
    beRegdate: DateTime.parse(json["BE_regdate"]),
  );

  Map<String, dynamic> toJson() => {
    "BE_idx": beIdx,
    "BE_type": beType,
    "BE_title": beTitle,
    "BE_content": beContent,
    "BE_url": beUrl,
    "BE_period_start": "${bePeriodStart.year.toString().padLeft(4, '0')}-${bePeriodStart.month.toString().padLeft(2, '0')}-${bePeriodStart.day.toString().padLeft(2, '0')}",
    "BE_period_end": "${bePeriodEnd.year.toString().padLeft(4, '0')}-${bePeriodEnd.month.toString().padLeft(2, '0')}-${bePeriodEnd.day.toString().padLeft(2, '0')}",
    "BE_notice": beNotice,
    "BE_path_img1": bePathImg1,
    "BE_path_img2": bePathImg2,
    "BE_path_img3": bePathImg3,
    "BE_result": beResult,
    "BE_regdate": beRegdate.toIso8601String(),
  };
}
