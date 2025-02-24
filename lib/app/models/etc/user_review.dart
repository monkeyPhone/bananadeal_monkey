// To parse this JSON data, do
//
//     final userReview = userReviewFromJson(jsonString);

import 'dart:convert';

UserReview userReviewFromJson(String str) => UserReview.fromJson(json.decode(str));

String userReviewToJson(UserReview data) => json.encode(data.toJson());

class UserReview {
  UserReview({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<ReviewList> result;

  factory UserReview.fromJson(Map<String, dynamic> json) => UserReview(
    status: json["status"],
    msg: json["msg"],
    result: List<ReviewList>.from(json["result"].map((x) => ReviewList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class ReviewList {
  ReviewList({
    required this.ruUserIdx,
    required this.diIdx,
    required this.smMid,
    required this.smStoreName,
    required this.dePsName,
    required this.smPathImg0,
    required this.ruIdx,
    required this.ruDiIdx,
    required this.ruPoint,
    required this.ruContent,
    required this.ruPathImg1,
    required this.ruPathImg2,
    required this.ruPathImg3,
    required this.raAnswer,
    this.dhRegdate,
    this.ruRegdate,
  });

  int ruUserIdx;
  int ruIdx;
  String smMid;
  int diIdx;
  String smStoreName;
  String dePsName;
  String smPathImg0;
  int ruPoint;
  int ruDiIdx;
  String ruContent;
  String ruPathImg1;
  String ruPathImg2;
  String ruPathImg3;
  String raAnswer;
  DateTime? dhRegdate;
  DateTime? ruRegdate;

  factory ReviewList.fromJson(Map<String, dynamic> json) => ReviewList(
    ruUserIdx: json["RU_user_idx"] ?? 0,
    ruIdx: json["RU_idx"] ?? 0,
    smMid: json["SM_m_id"] ?? '',
    diIdx: json["DI_idx"] ?? 0,
    smStoreName: json["SM_store_name"] ?? '',
    dePsName: json["DE_ps_name"] ?? '',
    ruDiIdx: json["RU_di_idx"] ?? 0,
    smPathImg0: json["SM_path_img0"] ?? '',
    ruPoint: json["RU_point"] ?? 0,
    ruContent: json["RU_content"] ?? '',
    ruPathImg1: json["RU_path_img1"] ?? '',
    ruPathImg2: json["RU_path_img2"] ?? '',
    ruPathImg3: json["RU_path_img3"] ?? '',
    raAnswer: json["RA_answer"] ?? '',
    dhRegdate: json["DH_regdate"] == null ? DateTime(0) : DateTime.parse(json["DH_regdate"]),
    ruRegdate: json["RU_regdate"] == null ? DateTime(0) : DateTime.parse(json["RU_regdate"]),
  );

  Map<String, dynamic> toJson() => {
    "RU_user_idx": ruUserIdx,
    "DI_idx": diIdx,
    "SM_m_id":smMid,
    "SM_store_name": smStoreName,
    "DE_ps_name": dePsName,
    "SM_path_img0": smPathImg0,
    "RU_point": ruPoint,
    "RU_content": ruContent,
    "RU_path_img1": ruPathImg1,
    "RU_path_img2": ruPathImg2,
    "RU_path_img3": ruPathImg3,
    "RA_answer": raAnswer,
    "DH_regdate": dhRegdate,
    "RU_regdate": ruRegdate
  };
}
