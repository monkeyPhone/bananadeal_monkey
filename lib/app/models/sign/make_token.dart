// To parse this JSON data, do
//
//     final makeTokken = makeTokkenFromJson(jsonString);

import 'dart:convert';

MakeTokken makeTokkenFromJson(String str) => MakeTokken.fromJson(json.decode(str));

String makeTokkenToJson(MakeTokken data) => json.encode(data.toJson());

class MakeTokken {
  MakeTokken({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List result;

  factory MakeTokken.fromJson(Map<String, dynamic> json) => MakeTokken(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? '',
    result: json["result"] ?? [],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": result,
  };
}
