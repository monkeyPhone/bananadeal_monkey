// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) => ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  int status;
  String msg;
  String eError;
  String route;
  String mRoute;
  String errorRouter;

  ErrorModel({
    required this.status,
    required this.msg,
    required this.eError,
    required this.route,
    required this.mRoute,
    required this.errorRouter
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? '',
    eError: json["eError"] ?? '',
    route: json["route"] ?? '',
    mRoute: json["mRoute"] ?? '',
    errorRouter: json["errorRouter"] ?? ''
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "eError": eError,
    "route": route,
    "mRoute": mRoute,
    "errorRouter": errorRouter
  };
}