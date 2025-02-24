import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/app/models/store/store_list_info.dart';

FavoriteListPage favoriteListPageFromJson(String str) => FavoriteListPage.fromJson(json.decode(str));

String favoriteListPageToJson(FavoriteListPage data) => json.encode(data.toJson());

class FavoriteListPage {
  int status;
  String msg;
  List<FavoriteResult> result;

  FavoriteListPage({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory FavoriteListPage.fromJson(Map<String, dynamic> json) => FavoriteListPage(
    status: json["status"],
    msg: json["msg"],
    result: List<FavoriteResult>.from(json["result"].map((x) => FavoriteResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class FavoriteResult {
  int total;
  int totalPages;
  List<Sinfo> list;

  FavoriteResult({
    required this.total,
    required this.totalPages,
    required this.list,
  });

  factory FavoriteResult.fromJson(Map<String, dynamic> json) => FavoriteResult(
    total: json["total"],
    totalPages: json["totalPages"],
    list: List<Sinfo>.from(json["list"].map((x) => Sinfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "totalPages": totalPages,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

