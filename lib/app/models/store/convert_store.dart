// To parse this JSON data, do
//
//     final convertStore = convertStoreFromJson(jsonString);

import 'dart:convert';

ConvertStore convertStoreFromJson(String str) => ConvertStore.fromJson(json.decode(str));

String convertStoreToJson(ConvertStore data) => json.encode(data.toJson());

class ConvertStore {
  int status;
  String msg;
  List<ConvertStoreList> result;

  ConvertStore({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory ConvertStore.fromJson(Map<String, dynamic> json) => ConvertStore(
    status: json["status"],
    msg: json["msg"],
    result: List<ConvertStoreList>.from(json["result"].map((x) => ConvertStoreList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class ConvertStoreList {
  String smMId;

  ConvertStoreList({
    required this.smMId,
  });

  factory ConvertStoreList.fromJson(Map<String, dynamic> json) => ConvertStoreList(
    smMId: json["SM_m_id"],
  );

  Map<String, dynamic> toJson() => {
    "SM_m_id": smMId,
  };
}
