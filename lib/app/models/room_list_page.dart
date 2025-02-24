import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_user_room_list.dart';

RoomListPage roomListPageFromJson(String str) => RoomListPage.fromJson(json.decode(str));

String roomListPageToJson(RoomListPage data) => json.encode(data.toJson());

class RoomListPage {
  int status;
  String msg;
  List<RoomListPageResult> result;

  RoomListPage({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory RoomListPage.fromJson(Map<String, dynamic> json) => RoomListPage(
    status: json["status"],
    msg: json["msg"],
    result: List<RoomListPageResult>.from(json["result"].map((x) => RoomListPageResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class RoomListPageResult {
  int total;
  int totalPages;
  List<RoomList> list;

  RoomListPageResult({
    required this.total,
    required this.totalPages,
    required this.list,
  });

  factory RoomListPageResult.fromJson(Map<String, dynamic> json) => RoomListPageResult(
    total: json["total"] ?? 0,
    totalPages: json["totalPages"] ?? 0,
    list: List<RoomList>.from(json["list"].map((x) => RoomList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "totalPages": totalPages,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}



