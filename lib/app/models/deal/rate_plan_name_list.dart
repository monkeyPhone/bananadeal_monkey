// To parse this JSON data, do
//
//     final ratePlanNameList = ratePlanNameListFromJson(jsonString);

import 'dart:convert';

RatePlanNameList ratePlanNameListFromJson(String str) => RatePlanNameList.fromJson(json.decode(str));

String ratePlanNameListToJson(RatePlanNameList data) => json.encode(data.toJson());

class RatePlanNameList {
  RatePlanNameList({
    required this.list,
  });

  List<NameList> list;

  factory RatePlanNameList.fromJson(Map<String, dynamic> json) => RatePlanNameList(
    list: List<NameList>.from(json["LIST"].map((x) => NameList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class NameList {
  NameList({
    required this.pgIdx,
    required this.tkIdx,
    required this.pgOrder,
    required this.pgName,
    required this.pgRegiDate,
    required this.pgEditDate,
  });

  String pgIdx;
  String tkIdx;
  String pgOrder;
  String pgName;
  String pgRegiDate;
  String pgEditDate;

  factory NameList.fromJson(Map<String, dynamic> json) => NameList(
    pgIdx: json["PG_idx"] ?? '',
    tkIdx: json["tk_idx"] ?? '',
    pgOrder: json["PG_order"] ?? '',
    pgName: json["PG_name"] ?? '',
    pgRegiDate: json["PG_regi_date"] ?? '',
    pgEditDate: json["PG_edit_date"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "PG_idx": pgIdx,
    "tk_idx": tkIdx,
    "PG_order": pgOrder,
    "PG_name": pgName,
    "PG_regi_date": pgRegiDate,
    "PG_edit_date": pgEditDate,
  };
}
