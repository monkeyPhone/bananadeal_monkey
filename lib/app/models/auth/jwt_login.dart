// To parse this JSON data, do
//
//     final jwtLogin = jwtLoginFromJson(jsonString);

import 'dart:convert';

JwtLogin jwtLoginFromJson(String str) => JwtLogin.fromJson(json.decode(str));

String jwtLoginToJson(JwtLogin data) => json.encode(data.toJson());

class JwtLogin {
  JwtLogin({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List result;

  factory JwtLogin.fromJson(Map<String, dynamic> json) => JwtLogin(
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
