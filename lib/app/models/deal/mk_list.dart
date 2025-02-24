// To parse this JSON data, do
//
//     final mkElement = mkElementFromJson(jsonString);

import 'dart:convert';

MkElement mkElementFromJson(String str) => MkElement.fromJson(json.decode(str));

String mkElementToJson(MkElement data) => json.encode(data.toJson());

class MkElement {
  List<MkList> list;

  MkElement({
    required this.list,
  });

  factory MkElement.fromJson(Map<String, dynamic> json) => MkElement(
    list: List<MkList>.from(json["LIST"].map((x) => MkList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class MkList {
  String mkIdx;
  String mkOrder;
  String mkName;
  String mkIsHidden;
  DateTime mkRegiDate;
  DateTime mkEditDate;

  MkList({
    required this.mkIdx,
    required this.mkOrder,
    required this.mkName,
    required this.mkIsHidden,
    required this.mkRegiDate,
    required this.mkEditDate,
  });

  factory MkList.fromJson(Map<String, dynamic> json) => MkList(
    mkIdx: json["MK_idx"] ?? '',
    mkOrder: json["MK_order"] ?? '',
    mkName: json["MK_name"] ?? '',
    mkIsHidden: json["MK_isHidden"] ?? '',
    mkRegiDate: DateTime.parse(json["MK_regi_date"]),
    mkEditDate: DateTime.parse(json["MK_edit_date"]),
  );

  Map<String, dynamic> toJson() => {
    "MK_idx": mkIdx,
    "MK_order": mkOrder,
    "MK_name": mkName,
    "MK_isHidden": mkIsHidden,
    "MK_regi_date": mkRegiDate.toIso8601String(),
    "MK_edit_date": mkEditDate.toIso8601String(),
  };
}
