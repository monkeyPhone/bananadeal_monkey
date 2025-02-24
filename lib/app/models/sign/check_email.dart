// To parse this JSON data, do
//
//     final checkEmail = checkEmailFromJson(jsonString);

import 'dart:convert';

CheckEmail checkEmailFromJson(String str) => CheckEmail.fromJson(json.decode(str));

String checkEmailToJson(CheckEmail data) => json.encode(data.toJson());

class CheckEmail {
  CheckEmail({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<Item> result;

  factory CheckEmail.fromJson(Map<String, dynamic> json) => CheckEmail(
    status: json["status"],
    msg: json["msg"],
    result: List<Item>.from(json["result"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "Item": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    required this.msg,
    required this.joinType,
    required this.authNumber,
  });

  String msg;
  String joinType;
  String authNumber;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    msg: json["msg"] ?? '',
    joinType: json["join_type"] ?? '',
    authNumber: json["authNumber"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "join_type": joinType,
    "authNumber": authNumber,
  };
}
