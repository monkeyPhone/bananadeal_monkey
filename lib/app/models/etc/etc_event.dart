// To parse this JSON data, do
//
//     final etcEvent = etcEventFromJson(jsonString);

import 'dart:convert';

EtcEvent etcEventFromJson(String str) => EtcEvent.fromJson(json.decode(str));

String etcEventToJson(EtcEvent data) => json.encode(data.toJson());

class EtcEvent {
  int status;
  String msg;
  List<EtcEventList> result;

  EtcEvent({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory EtcEvent.fromJson(Map<String, dynamic> json) => EtcEvent(
    status: json["status"],
    msg: json["msg"],
    result: List<EtcEventList>.from(json["result"].map((x) => EtcEventList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class EtcEventList {
  String beStatus;
  int beIdx;
  String beTitle;
  DateTime bePeriodStart;
  DateTime bePeriodEnd;
  String bePathImg1;


  EtcEventList({
    required this.beStatus,
    required this.beIdx,
    required this.beTitle,
    required this.bePeriodStart,
    required this.bePeriodEnd,
    required this.bePathImg1,

  });

  factory EtcEventList.fromJson(Map<String, dynamic> json) => EtcEventList(
    beStatus: json["BE_status"] ?? '',
    beIdx: json["BE_idx"] ?? 0,
    beTitle: json["BE_title"] ?? '',
    bePeriodStart: DateTime.parse(json["BE_period_start"]),
    bePeriodEnd: DateTime.parse(json["BE_period_end"]),
    bePathImg1: json["BE_path_img1"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "BE_status": beStatus,
    "BE_idx": beIdx,
    "BE_title": beTitle,
    "BE_period_start": "${bePeriodStart.year.toString().padLeft(4, '0')}-${bePeriodStart.month.toString().padLeft(2, '0')}-${bePeriodStart.day.toString().padLeft(2, '0')}",
    "BE_period_end": "${bePeriodEnd.year.toString().padLeft(4, '0')}-${bePeriodEnd.month.toString().padLeft(2, '0')}-${bePeriodEnd.day.toString().padLeft(2, '0')}",
    "BE_path_img1": bePathImg1,
  };
}
