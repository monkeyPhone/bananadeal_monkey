// To parse this JSON data, do
//
//     final walfareList = walfareListFromJson(jsonString);

import 'dart:convert';

WalfareList walfareListFromJson(String str) => WalfareList.fromJson(json.decode(str));

String walfareListToJson(WalfareList data) => json.encode(data.toJson());

class WalfareList {
  WalfareList({
    required this.result,
    required this.list,
  });

  String result;
  List<WalFare> list;

  factory WalfareList.fromJson(Map<String, dynamic> json) => WalfareList(
    result: json["result"],
    list: List<WalFare>.from(json["LIST"].map((x) => WalFare.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class WalFare {
  WalFare({
    required this.pwIdx,
    required this.pwName,
    required this.pwDiscountText,
    required this.pwWelfareText,
    required this.pwOrder,
    required this.pwRegidate,
  });

  String pwIdx;
  String pwName;
  String pwDiscountText;
  String pwWelfareText;
  String pwOrder;
  DateTime pwRegidate;

  factory WalFare.fromJson(Map<String, dynamic> json) => WalFare(
    pwIdx: json["PW_idx"] ?? '',
    pwName: json["PW_name"] ?? '',
    pwDiscountText: json["PW_discountText"] ?? '',
    pwWelfareText: json["PW_welfareText"] ?? '',
    pwOrder: json["PW_order"] ?? '',
    pwRegidate: DateTime.parse(json["PW_regidate"]),
  );

  Map<String, dynamic> toJson() => {
    "PW_idx": pwIdx,
    "PW_name": pwName,
    "PW_discountText": pwDiscountText,
    "PW_welfareText": pwWelfareText,
    "PW_order": pwOrder,
    "PW_regidate": pwRegidate.toIso8601String(),
  };
}
