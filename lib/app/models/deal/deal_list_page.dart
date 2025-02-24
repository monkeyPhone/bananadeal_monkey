import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/app/models/nav/deal/deal_status.dart';

DealListPage dealListPageFromJson(String str) => DealListPage.fromJson(json.decode(str));

String dealListPageToJson(DealListPage data) => json.encode(data.toJson());

class DealListPage {
  int status;
  String msg;
  List<DealListPaeResult> result;

  DealListPage({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory DealListPage.fromJson(Map<String, dynamic> json) => DealListPage(
    status: json["status"],
    msg: json["msg"],
    result: List<DealListPaeResult>.from(json["result"].map((x) => DealListPaeResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class DealListPaeResult {
  int total;
  int totalPages;
  List<DealStatusList> list;

  DealListPaeResult({
    required this.total,
    required this.totalPages,
    required this.list,
  });

  factory DealListPaeResult.fromJson(Map<String, dynamic> json) => DealListPaeResult(
    total: json["total"],
    totalPages: json["totalPages"],
    list: List<DealStatusList>.from(json["list"].map((x) => DealStatusList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "totalPages": totalPages,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}
