// To parse this JSON data, do
//
//     final bookmarkSetting = bookmarkSettingFromJson(jsonString);

import 'dart:convert';

import '../store/store_list_info.dart';



BookmarkSetting bookmarkSettingFromJson(String str) => BookmarkSetting.fromJson(json.decode(str));

String bookmarkSettingToJson(BookmarkSetting data) => json.encode(data.toJson());

class BookmarkSetting {
  BookmarkSetting({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<Sinfo> result;

  factory BookmarkSetting.fromJson(Map<String, dynamic> json) => BookmarkSetting(
    status: json["status"],
    msg: json["msg"],
    result: List<Sinfo>.from(json["result"].map((x) => Sinfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}


