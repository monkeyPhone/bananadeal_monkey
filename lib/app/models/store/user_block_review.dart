// To parse this JSON data, do
//
//     final userBlockReview = userBlockReviewFromJson(jsonString);

import 'dart:convert';

UserBlockReview userBlockReviewFromJson(String str) => UserBlockReview.fromJson(json.decode(str));

String userBlockReviewToJson(UserBlockReview data) => json.encode(data.toJson());

class UserBlockReview {
  int status;
  String msg;
  List<UserBlockReviewList> result;

  UserBlockReview({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory UserBlockReview.fromJson(Map<String, dynamic> json) => UserBlockReview(
    status: json["status"],
    msg: json["msg"],
    result: List<UserBlockReviewList>.from(json["result"].map((x) => UserBlockReviewList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class UserBlockReviewList {
  String buMIdxPe;

  UserBlockReviewList({
    required this.buMIdxPe,
  });

  factory UserBlockReviewList.fromJson(Map<String, dynamic> json) => UserBlockReviewList(
    buMIdxPe: json["BU_m_idx_pe"],
  );

  Map<String, dynamic> toJson() => {
    "BU_m_idx_pe": buMIdxPe,
  };
}