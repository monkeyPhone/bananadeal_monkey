// To parse this JSON data, do
//
//     final appPushStatus = appPushStatusFromJson(jsonString);

import 'dart:convert';

AppPushStatus appPushStatusFromJson(String str) => AppPushStatus.fromJson(json.decode(str));

String appPushStatusToJson(AppPushStatus data) => json.encode(data.toJson());

class AppPushStatus {
  int status;
  String msg;
  List<AppPushStatusList> result;

  AppPushStatus({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory AppPushStatus.fromJson(Map<String, dynamic> json) => AppPushStatus(
    status: json["status"],
    msg: json["msg"],
    result: List<AppPushStatusList>.from(json["result"].map((x) => AppPushStatusList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class AppPushStatusList {
  String mAppPush;
  String mGwanggoPush;
  String mChatPush;

  AppPushStatusList({
    required this.mAppPush,
    required this.mGwanggoPush,
    required this.mChatPush,
  });

  factory AppPushStatusList.fromJson(Map<String, dynamic> json) => AppPushStatusList(
    mAppPush: json["M_app_push"] ?? 'Y',
    mGwanggoPush: json["M_gwanggo_push"] ?? 'Y',
    mChatPush: json["M_chat_push"] ?? 'Y',
  );

  Map<String, dynamic> toJson() => {
    "M_app_push": mAppPush,
    "M_gwanggo_push": mGwanggoPush,
    "M_chat_push": mChatPush,
  };
}
