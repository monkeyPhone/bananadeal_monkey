// To parse this JSON data, do
//
//     final userDeclarationReview = userDeclarationReviewFromJson(jsonString);

import 'dart:convert';

UserDeclarationReview userDeclarationReviewFromJson(String str) => UserDeclarationReview.fromJson(json.decode(str));

String userDeclarationReviewToJson(UserDeclarationReview data) => json.encode(data.toJson());

class UserDeclarationReview {
  int status;
  String msg;
  List<UserDeclarationReviewList> result;

  UserDeclarationReview({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory UserDeclarationReview.fromJson(Map<String, dynamic> json) => UserDeclarationReview(
    status: json["status"],
    msg: json["msg"],
    result: List<UserDeclarationReviewList>.from(json["result"].map((x) => UserDeclarationReviewList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class UserDeclarationReviewList {
  int bruIdx;
  String bruMIdxPe;
  String bruTitle;
  String bruRuIdx;
  String bruType;
  String bruSmMid;

  UserDeclarationReviewList({
    required this.bruIdx,
    required this.bruMIdxPe,
    required this.bruTitle,
    required this.bruRuIdx,
    required this.bruType,
    required this.bruSmMid
  });

  factory UserDeclarationReviewList.fromJson(Map<String, dynamic> json) => UserDeclarationReviewList(
    bruIdx: json["BRU_idx"],
    bruMIdxPe: json["BRU_m_idx_pe"],
    bruTitle: json["BRU_title"],
    bruRuIdx: json["BRU_ru_idx"],
    bruType: json["BRU_type"],
    bruSmMid: json["BRU_sm_m_id"]
  );

  Map<String, dynamic> toJson() => {
    "BRU_idx": bruIdx,
    "BRU_m_idx_pe": bruMIdxPe,
    "BRU_title": bruTitle,
    "BRU_ru_idx": bruRuIdx,
    "BRU_type": bruType,
    "BRU_sm_m_id": bruSmMid,
  };
}
