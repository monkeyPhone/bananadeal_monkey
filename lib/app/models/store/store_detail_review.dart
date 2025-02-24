// To parse this JSON data, do
//
//     final storeReview = storeReviewFromJson(jsonString);

import 'dart:convert';



StoreReview storeReviewFromJson(String str) => StoreReview.fromJson(json.decode(str));

String storeReviewToJson(StoreReview data) => json.encode(data.toJson());

class StoreReview {
  int status;
  String msg;
  List<StoreReViewList> result;

  StoreReview({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory StoreReview.fromJson(Map<String, dynamic> json) => StoreReview(
    status: json["status"],
    msg: json["msg"],
    result: List<StoreReViewList>.from(json["result"].map((x) => StoreReViewList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class StoreReViewList {
  String mName;
  int ruIdx;
  int ruUserIdx;
  int ruPoint;
  String ruContent;
  String ruPathImg1;
  String ruPathImg2;
  String ruPathImg3;
  DateTime ruRegdate;
  String? raAnswer;
  String ruActivate;
  String ruIsBlock;
  String ruIsReport;
  String visible;
  String bruTitle;

  StoreReViewList({
    required this.mName,
    required this.ruIdx,
    required this.ruUserIdx,
    required this.ruPoint,
    required this.ruContent,
    required this.ruPathImg1,
    required this.ruPathImg2,
    required this.ruPathImg3,
    required this.ruRegdate,
    this.raAnswer,
    required this.ruActivate,
    required this.ruIsBlock,
    required this.ruIsReport,
    required this.visible,
    required this.bruTitle,
  });

  factory StoreReViewList.fromJson(Map<String, dynamic> json) => StoreReViewList(
    mName: json["M_name"] ?? '익명',
    ruIdx: json["RU_idx"],
    ruUserIdx: json["RU_user_idx"],
    ruPoint: json["RU_point"],
    ruContent: json["RU_content"],
    ruPathImg1: json["RU_path_img1"],
    ruPathImg2: json["RU_path_img2"],
    ruPathImg3: json["RU_path_img3"],
    ruRegdate: DateTime.parse(json["RU_regdate"]),
    raAnswer: json["RA_answer"],
    ruActivate: json['RU_activate'] ?? 'Y',
    ruIsBlock: json['RU_isBlock'] ?? 'N',
    ruIsReport: json['RU_isReport'] ?? 'N',
    visible: json['visible'] ?? 'N',
    bruTitle: json['BRU_title'] ?? ''
  );

  Map<String, dynamic> toJson() => {
    "M_name": mName,
    "RU_idx": ruIdx,
    "RU_user_idx": ruUserIdx,
    "RU_point": ruPoint,
    "RU_content": ruContent,
    "RU_path_img1": ruPathImg1,
    "RU_path_img2": ruPathImg2,
    "RU_path_img3": ruPathImg3,
    "RU_regdate": ruRegdate.toIso8601String(),
    "RA_answer": raAnswer,
    "RU_activate": ruActivate,
    "RU_isBlock" : ruIsBlock,
    "RU_isReport" : ruIsReport,
    "visible": visible,
    "BRU_title" : bruTitle
  };
}
